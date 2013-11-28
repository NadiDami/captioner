class SubmissionsController < ApplicationController


  def new
    @submission = Submission.new
  end

  def create

    @submission = current_user.submissions.build params[:submission].permit(:description, :photo)
    @submission.save
    redirect_to root_path
  end

  def show
    @submission = Submission.find(params[:id])
    @deets = @submission.photo
  end

end
