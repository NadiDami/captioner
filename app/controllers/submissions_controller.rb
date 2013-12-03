class SubmissionsController < ApplicationController


  def new
    @submission = Submission.new
  end

  def create

    @submission = current_user.submissions.build params[:submission].permit(:description, :photo, :tag_names)
    if @submission.save
      flash[:notice] = 'Photo added'
      redirect_to root_path
    else
      render 'new'
    end

  end

  def show
    @submission = Submission.find(params[:id])
    @deets = @submission.photo
  end

end
