class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  
  belongs_to :team
  
  has_many :checkins
  
  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    twitter_uid = access_token['uid']
    if user = User.find_by_twitter_uid(twitter_uid)
      user
    else
      User.new
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
  
  def checked_in_on?(date)
    checkins.where(['checked_in_on = DATE(?)', date]).first
  end
  
  def on_time_on?(date)
    checkins.where(['created_at >= ? AND created_at <= ?', date.midnight, date.beginning_of_day + 10.hours]).first
  end
end
