class JobsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @jobs = Job.all.order(created_at: :desc)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.build(job_params)
    if @job.save
      redirect_to @job, notice: "Job was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job, notice: "Job was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_url, notice: "Job was successfully destroyed."
  end

  def destroy_all
    current_user.jobs.destroy_all
    redirect_to edit_user_registration_path, notice: "All jobs have been deleted."
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :company, :location)
  end
end
