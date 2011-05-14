class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :uid, :screen_name
  belongs_to :team
  
  attr_accessor :uid, :screen_name
  
  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    twitter_uid = access_token['uid']
    if user = User.find_by_twitter_uid(twitter_uid)
      user
    else
      User.create!(:email => nil, :uid => twitter_uid, :password => Devise.friendly_token[0,20])
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.twitter_data']
        user.uid = session['devise.twitter_data']['uid']
        user.screen_name = session['devise.twitter_data']['screen_name']
      end
    end
  end
  
  def email_required?
    twitter_uid?
  end
end
