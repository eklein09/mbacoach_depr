class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find( params[:id] )
  end

  def new
    redirect_to "/users/sign_up"
  end

  def edit
    @user = User.find( params[ :id] )
  end

  def update
    @user = User.find(params[:id])

    @user.gmat = params[:gmat]
    @user.gpa = params[:gpa]
    @user.industry = params[:industry]
    @user.collegerank = params[:collegerank]
    @user.timeinservice = params[:timeinservice]
    @user.major = params[ :major ]
    @user.prohelp = params[ :prohelp ]

    if @user.save
      redirect_to "/users", :notice => "My stats were updated successfully."
    else
      render 'edit'
    end
  end

  def estimateProbabilities
    @user = User.find( params[:id] )
  end

end
