#user.rb

class User < ActiveRecord::Base
  has_many :todos
  has_secure_password

  def to_pleasant_string
    "#{id}. #{first_name} #{last_name} #{email}"
  end
end
