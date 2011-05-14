class UserMailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def teammember_invite(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

end
