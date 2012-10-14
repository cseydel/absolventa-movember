class Bro < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :firstname, :lastname
  has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "200x200>" }

  before_save
  validates :firstname, :lastname, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :length => { :in => 6..20 }
  validates_attachment :avatar, :presence => true, :size => { :in => 0..5.megabytes }
end