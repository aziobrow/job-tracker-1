class CommentsController < ApplicationController
  def create
    @job = Job.find(params[:job_id])
    @comment = @job.comments.create(comment_params)

    redirect_to company_job_path(@job.company_id, @job)
  end

private

  def comment_params
    params.require(:comment).permit(:content, :job_id)
  end

end
