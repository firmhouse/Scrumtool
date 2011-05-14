class TeamsController < ApplicationController

  def new
    @team = Team.new
  end
  
  def create
    team = Team.new(params[:team])
    if team.save
      redirect_to root_path
    else
      render :new
    end
  end
end
