class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.find_for_twitter_oauth(env['omniauth.auth'], current_user)
    
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callback.success", :kind => "Twitter"
      sign_in_and_redirect @user, :event => :authentication
    else
      session['devise.twitter_data'] = {
        'uid' => env['omniauth.auth']['uid'],
        'screen_name' => env['omniauth.auth']['extra']['user_hash']['screen_name']
      }
      redirect_to new_user_registration_url
    end
  end
end