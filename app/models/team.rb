class Team < ActiveRecord::Base
  validates :name, :subdomain, :presence => true
  validates :subdomain, :uniqueness => true
  
  has_many :users
  
  accepts_nested_attributes_for :users
  
  has_many :checkins, :through => :users
  
end
