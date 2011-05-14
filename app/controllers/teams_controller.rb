class TeamsController < ApplicationController

  def new
    @team = Team.new
    @team.users.build
  end
  
  def create
    @team = Team.new(params[:team])
    
    first_user = @team.users.first
    first_user.admin = true
    
    @team.invite_code = Devise.friendly_token[0,20]
    
    if @team.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @team = Team.find(params[:id])
  end
  
end
