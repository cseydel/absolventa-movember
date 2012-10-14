class Moustache < ActiveRecord::Base

  attr_accessible :name, :description
  validates :name, :description, :presence => true

end

