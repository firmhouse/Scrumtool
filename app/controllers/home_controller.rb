class HomeController < ApplicationController
  
  before_filter :authenticate_user!, :only => :dashboard

  def index
    if user_signed_in?
      redirect_to dashboard_path
    end
    @team = Team.new
  end
  
  def dashboard    
    @checked_in_members = @team.users.reject { |u| !u.checked_in_on?(Date.today) }
    @members_too_late = @team.users.reject { |u| u.on_time_on?(Date.today) } & @checked_in_members
    
    @members_on_time = @checked_in_members - @members_too_late
    
    render :layout => "dashboard"
  end
  
end
