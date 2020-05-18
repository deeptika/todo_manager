#users_controller.rb

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def new
    render "users/new"
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(first_name: first_name, last_name: last_name, email: email, password: password)
    redirect_to "/"
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
