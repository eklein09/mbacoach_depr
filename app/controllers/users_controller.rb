class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    redirect_to "/users/sign_up"
  end

  def edit
    @user = User.find_by( params[ :id] )
  end

end
