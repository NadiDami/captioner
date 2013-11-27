class Submission < ActiveRecord::Base

    has_attached_file :photo, styles: { medium: "250x250>", thumb: "100x100>" }

    belongs_to :user

    validates :description, length: { minimum: 3}
    validates :photo, attachment_presence: { message: 'Make sure to attach a photo!'}
end
