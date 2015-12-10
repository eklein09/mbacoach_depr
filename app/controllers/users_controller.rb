class UsersController < ApplicationController

  def index
    if current_user.admin? then
      @users = User.all
    else
      redirect_to '/', :notice=> "This action is not permitted."
    end
  end

  def show
    @user = User.find( params[:id] )
    if current_user!=@user then
      redirect_to '/users', :notice => "Only your own stats are visible."
    else
      render 'show'
    end
  end

  def new
    redirect_to "/users/sign_up"
  end

  def edit
    @user = User.find( params[ :id] )
    if current_user!=@user then
      redirect_to '/users', :notice => "Can only edit yourself."
    else
      render 'edit'
    end
  end

  def update
    @user = User.find(params[:id])
    if current_user!=@user then
      redirect_to '/users', :notice => "Can only edit yourself."
    else
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

  end

  def estimateProbabilities
    @user = User.find( params[:id] )
    if current_user!=@user
      redirect_to '/users', notice: 'Only your own probabilities are visible.'
    else
      a = `Rscript predict.r #{@user.gmat} #{@user.gpa} "#{@user.industry}" #{Application::DISPLAY_HELP[@user.prohelp.to_s]} No Bachelors 2009 2014 3 15 "#{@user.major}" No 4 1 hbs 5`
      b = /(?<=\[1\]\s)((.|\n)+)/.match(a)
      c = b.to_s.gsub(/\[\d+\]/, "")
      @d = c.split(" ")
      render 'estimateProbabilities'
    end
  end

  def destroy
    if current_user.admin? then
      user = User.find(params[:id])
      user.destroy
      redirect_to '/users/', :notice => "User deleted."
    else
      redirect_to '/users/', :notice => "Not permitted."
    end
  end

end
