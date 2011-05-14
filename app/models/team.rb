class Team < ActiveRecord::Base
  has_many :users
  
  validates :name, :subdomain, :presence => true
  validates :subdomain, :uniqueness => true
  
  accepts_nested_attributes_for :users
end
