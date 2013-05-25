class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :authorizations
  has_many :posts
  validates :name, :email, :presence => true
end
