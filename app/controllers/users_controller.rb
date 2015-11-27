class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    redirect_to "/users/sign_up"
  end

end
