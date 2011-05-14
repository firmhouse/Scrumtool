class TeamsController < ApplicationController

  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(params[:team])
    
    if @team.save
      user = @team.users.build(:login => params[:user_attributes][:email], :email => params[:user_attributes][:email], :first_name => params[:user_attributes][:first_name], :last_name => params[:user_attributes][:last_name], :password => params[:user_attributes][:password], :password_confirmation => params[:user_attributes][:password_confirmation])

      redirect_to root_path
    else
      render :new
    end
  end
end
