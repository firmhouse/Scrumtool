class ApplicationController < ActionController::Base
  protect_from_forgery
    
  before_filter :fetch_team_from_subdomain
  
  def fetch_team_from_subdomain
    if request.subdomain
      @team = Team.find_by_subdomain(request.subdomain)
    end
  end
end
