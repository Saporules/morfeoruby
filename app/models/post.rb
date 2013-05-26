class Post < ActiveRecord::Base
  attr_accessible :contenido, :ip, :privacidad
  has_many :tags
  belongs_to :user
end
