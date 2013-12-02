class CaptionsController < ApplicationController
  
  def index

  end

  def create
    
    this_submission =  Submission.find params[:submission_id]


    @caption = this_submission.captions.build params[:caption].permit(:text,:captioned_photo)
    @caption.captioned_photo = this_submission.photo
    @caption.save
    redirect_to request.referer
  end

end
