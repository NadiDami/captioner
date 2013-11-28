class Caption < ActiveRecord::Base
  has_attached_file :captioned_photo,
                  processors: [:captionbitch],
                  styles: {
                    polarized: {
                      format: '.png',
                      is_polarized: true
                    }
                  } 

  belongs_to :submission
end
