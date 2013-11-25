class SubmissionsController < ApplicationController

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new params[:submission].permit(:description)
    @submission.save
    redirect_to root_path
  end

end
