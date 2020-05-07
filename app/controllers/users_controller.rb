#users_controller.rb

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name, email: email, password: password)
    response_text = "New user created with user ID #{new_user.id}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    user_found = User.find_by(email: email, password: password)
    response_text = "true"
    if user_found == nil
      response_text = "false"
    end
    render plain: response_text
  end
end
