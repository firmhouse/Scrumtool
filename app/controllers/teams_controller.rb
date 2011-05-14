class TeamsController < ApplicationController

  def new
    @team = Team.new
  end
  
  def create
    team = Team.new(params[:team])
    
    
    if team.save
      user = team.users.build(:login => login_name, :email => school.contact_email, :first_name => school.contact_first_name, :last_name => school.contact_last_name, :password => temp_password, :password_confirmation => temp_password)

      redirect_to root_path
    else
      render :new
    end
  end
end
