class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @contact = Contact.new
    if params[:sort] == "location"
      @jobs =
      @company.jobs
        .order(:city)
    elsif params[:sort] == "interest"
      @jobs =
      @company.jobs
        .order(level_of_interest: "DESC")
    else
      @jobs = @company.jobs
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    #@comment.article_id = @article.id
  end

  def edit
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)

    flash.notice = "#{@job.title} at #{@job.company.name} updated!"

    redirect_to company_job_path(@job.company, @job)
  end


  def destroy
    job = Job.find(params[:id])
    job.destroy

    flash.notice = "#{job.company.name}: #{job.title} was successfully deleted!"

    redirect_to company_jobs_path(job.company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company)
  end
end
