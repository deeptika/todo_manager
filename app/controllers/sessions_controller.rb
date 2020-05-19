#sessions_controller.rb

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "You have successfully logged in"
    else
      render plain: "Invalid email/password"
    end
  end
end
