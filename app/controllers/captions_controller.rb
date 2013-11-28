class CaptionsController < ApplicationController
  
  def index

  end

  def create
    
    this_submission =  Submission.find params[:submission_id]

    # new_image_file_name = create_new_image this_submission, params
    # this_submission.photo

    # raise this_submission.photo
    # params[:caption][:captioned_photo] = this_submission.photo

    # raise params.inspect

    @caption = this_submission.captions.build params[:caption].permit(:text,:captioned_photo)
    @caption.captioned_photo = this_submission.photo
    @caption.save
    redirect_to request.referer
  end

end
