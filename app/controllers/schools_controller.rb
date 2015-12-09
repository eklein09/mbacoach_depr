class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new

    @school.name = params[:name]



    if @school.save
      redirect_to "/schools", :notice => "School created successfully."
    else
      render 'new'
    end

  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])


    @school.name = params[:name]



    if @school.save
      redirect_to "/schools", :notice => "School updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    if current_user.admin? then
      @school = School.find(params[:id])

      @school.destroy


      redirect_to "/schools", :notice => "School deleted."
    else
      redirect_to "/schools", :notice => "This action is not permitted."
    end

  end
end
