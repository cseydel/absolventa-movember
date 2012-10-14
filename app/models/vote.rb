class Vote < ActiveRecord::Base

  attr_accessible :money_value, :bro, :moustache

  belongs_to :bro
  belongs_to :moustache

  validates_presence_of :money_value
  validates_numericality_of :money_value

end
