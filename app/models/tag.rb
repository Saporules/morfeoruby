class Tag < ActiveRecord::Base
  attr_accessible :etiqueta
  belongs_to :post
end
