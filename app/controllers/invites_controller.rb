class InvitesController < ApplicationController
  
  def show
    @team = Team.find_by_subdomain_and_invite_code!(request.subdomain, params[:id])
    
    session['devise.team_id'] = @team.id
    
    redirect_to user_omniauth_authorize_path(:twitter)
  end
  
end
