class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to dashboard_path
    end
  end
  
  def dashboard
    render :layout => "application"
  end
  
end
