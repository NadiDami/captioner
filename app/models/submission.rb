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


    belongs_to :user
    has_many :captions
end


# has_attached_file :photo,
#                   processors: [:polarize],
#                   styles: {
#                     polarized: {
#                       format: '.png',
#                       is_polarized: true
#                     }
#                   } 