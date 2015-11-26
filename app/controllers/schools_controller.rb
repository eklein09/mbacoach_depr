class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

  def show
    @school = School.find_by(id: params[:id])
  end

  def new
  end

  def create
    @school = School.new
    @school.name = params[:name]

    if @school.save
      redirect_to schools_url, notice: "School created successfully."
    else
      render 'new'
    end
  end

  def edit
    @school = School.find_by(id: params[:id])
  end

  def update
    @school = School.find_by(id: params[:id])
    @school.name = params[:name]

    if @school.save
      redirect_to schools_url, notice: "School updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @school = School.find_by(id: params[:id])
    @school.destroy

    redirect_to schools_url, notice: "School deleted."
  end
end
