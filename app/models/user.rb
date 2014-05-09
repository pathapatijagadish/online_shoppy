class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :email,:password,:password_confirmation,:mobile_number
  validates :password,:confirmation =>true,:presence=>true
  validates :name,:email,:presence => true
  validates :mobile_number,:length=>{:in=>10..12}
  validates :email,:mobile_number, :uniqueness => { :case_sensitive => false }
end
