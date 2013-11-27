class Submission < ActiveRecord::Base

    has_attached_file :photo, styles: { medium: "250x250>", thumb: "100x100>" }

    belongs_to :user
end
