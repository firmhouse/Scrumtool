class Team < ActiveRecord::Base
  has_many :users
  
  validates :name, :subdomain, :presence => true
  validates :subdomain, :uniqueness => true
end
