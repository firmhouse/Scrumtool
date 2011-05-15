class ApplicationController < ActionController::Base
  protect_from_forgery
    
  before_filter :fetch_team_from_subdomain
  
  def fetch_team_from_subdomain
    if request.subdomain
      @team = Team.find_by_subdomain(request.subdomain)
    end
  end
  
  def after_update_path_for(resource)
    edit_user_registration_path
  end
  
  def after_sign_in_path_for(resource)
    dashboard_path
  end
end
