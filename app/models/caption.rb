class Caption < ActiveRecord::Base
  has_attached_file :captioned_photo,
                  processors: [:captionbitch],
                  styles: -> (attachment) {
                      {
                      comic: {
                        format: '.png',
                        comic: true,
                        the_text: attachment.instance.text,
                        original_image: attachment.uploaded_file,
                        mask: Rails.root.join('public/mask.png')
                      }
                    }
                  } 

  belongs_to :submission
end





