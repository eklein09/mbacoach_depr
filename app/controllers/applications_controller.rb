class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find_by(id: params[:id])
  end

  def new
  end

  def create
    @application = Application.new
    @application.school_id = params[:school_id]
    @application.applicant_id = params[:applicant_id]
    @application.outcome = params[:outcome]
    @application.submission_year = params[:submission_year]

    if @application.save
      redirect_to applications_url, notice: "Application created successfully."
    else
      render 'new'
    end
  end

  def edit
    @application = Application.find_by(id: params[:id])
  end

  def update
    @application = Application.find_by(id: params[:id])
    @application.school_id = params[:school_id]
    @application.applicant_id = params[:applicant_id]
    @application.outcome = params[:outcome]
    @application.submission_year = params[:submission_year]

    if @application.save
      redirect_to applications_url, notice: "Application updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @application = Application.find_by(id: params[:id])
    @application.destroy

    redirect_to applications_url, notice: "Application deleted."
  end
end
