class Post < ActiveRecord::Base
  attr_accessible :contenido, :ip
  has_many :tags
end
