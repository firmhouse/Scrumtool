class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to dashboard_path
    end
    @team = Team.new
  end
  
  def dashboard
    
  end
  
end
