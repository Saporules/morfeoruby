class Post < ActiveRecord::Base
  attr_accessible :contenido, :ip, :publico, :privado, :anonimo
  has_many :tags
end
