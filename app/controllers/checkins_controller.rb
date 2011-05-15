class CheckinsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    if checkin = current_user.checkins.create(:checked_in_on => Date.today)
      redirect_to dashboard_path
    end
  end
  
  def index
  end
end
