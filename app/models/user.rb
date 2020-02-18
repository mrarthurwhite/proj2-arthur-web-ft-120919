class User < ActiveRecord::Base
  has_secure_password
  has_many :missions
  validates_presence_of :username, :email, :password
  validates :email, uniqueness: true
  validates :username, uniqueness: true


  def user_name
    u= self.username
    u.gsub(" ","-")
  end

  def self.find_by_user_name(param)
    param.gsub!("-"," ")
    User.find_by(:username => param)
  end


end
