class Moustache < ActiveRecord::Base

  attr_accessible :name, :description
  validates :name, :description, :presence => true

  has_many :votes

  def vote_count
    votes.size
  end

end

