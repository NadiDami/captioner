module SubmissionHelper

  def tag_names(submission)
    submission.tags.pluck(:name).join(", ")
  end
end
