#user.rb

class User < ActiveRecord::Base
  has_many :todos

  def to_pleasant_string
    "#{id}. #{first_name} #{last_name} #{email}"
  end
end
