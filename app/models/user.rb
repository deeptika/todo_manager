#user.rb

class User < ActiveRecord::Base
  has_many :todos
  has_secure_password

  validates :first_name, presence: true
  validates :email, presence: true

  def to_pleasant_string
    "#{id}. #{first_name} #{last_name} #{email}"
  end
end
