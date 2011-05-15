class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  
  belongs_to :team
  
  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    twitter_uid = access_token['uid']
    if user = User.find_by_twitter_uid(twitter_uid)
      user
    else
      User.new
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.twitter_data']
        user.twitter_uid = session['devise.twitter_data']['uid']
        user.twitter_screen_name = session['devise.twitter_data']['screen_name']
      end
    end
  end
  
  def email_required?
    !twitter_uid?
  end
  
  def name
    [first_name, last_name].join(' ')
  end
  
  def update_with_password(params = {})
    params.delete(:password) if params[:password].blank?
    params.delete(:password_confirmation) if  params[:password_confirmation].blank?
    
    update_attributes(params)
  end
end
