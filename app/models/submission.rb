class Submission < ActiveRecord::Base
    # before_post_process :before_post_process

    # has_attached_file :photo, styles: { medium: "200x200^"}

    has_attached_file :photo,
                  processors: [:polarize],
                  styles: {
                    polarized: {
                      format: '.png',
                      is_polarized: true
                    }
                  } 


    # has_attached_file :photo, styles: { medium: "250x250>", thumb: "100x100>" }

    belongs_to :user
    has_many :captions
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