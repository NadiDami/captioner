class Submission < ActiveRecord::Base

    has_attached_file :photo, styles: { medium: "250x250>", thumb: "100x100>" }

    belongs_to :user

    validates :description, length: { minimum: 3}
    validates :photo, attachment_presence: { message: 'Make sure to attach a photo!'}

    has_and_belongs_to_many :tags

    def tag_names
      ''
    end

    def tag_names=(tags_string)
      tags_string.split(' ').each do |tag|
        new_tag = Tag.find_or_create_by(name: tag)
        new_tag.slug = new_tag.name.downcase
        new_tag.save
        
        self.tags << new_tag
      end
    end
end
