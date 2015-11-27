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

  def update
    @user = User.find(params[:id])


    @user.timeinservice = params[:timeinservice]
    @user.major = params[ :major ]

    if @user.save
      redirect_to "/users", :notice => "My stats were updated successfully."
    else
      render 'edit'
    end
  end

end
