class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @team = Team.find_by_subdomain(request.subdomain)
    @user = @team.users.find_for_twitter_oauth(env['omniauth.auth'], current_user)
    
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callback.success", :kind => "Twitter"
      sign_in_and_redirect @user, :event => :authentication
    else
      if session['devise.team_id'] == @team.id
        u = User.new
        u.twitter_screen_name = env['omniauth.auth']['extra']['user_hash']['screen_name']
        u.twitter_uid = env['omniauth.auth']['uid']
        u.password = Devise.friendly_token[0,20]
        u.team_id = session['devise.team_id']
        if u.save
          sign_in_and_redirect u, :event => :authentication
        else
          redirect_to new_user_registration_path
        end
      else
        redirect_to new_user_registration_path
      end
    end
  end
end