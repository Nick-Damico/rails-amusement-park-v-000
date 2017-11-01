class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  def mood
  	self.nausea > self.happiness ? "sad" : "happy"
  end

  def current_user
  	binding.pry
  	@current_user ||= User.find_by(id: session[:id])
  end

  def is_admin?
    self.admin
  end
end
