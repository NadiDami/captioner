module SubmissionHelper

  def tag_names(submission)
    tag_links = submission.tags.map do |tag|
      link_to(tag.name, tag)
    end

    tag_links.join(", ").html_safe
  end



end
