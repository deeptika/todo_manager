#users_controller.rb

class UsersController < ApplicationController
  def index
    render plain: "/users"
  end
end
