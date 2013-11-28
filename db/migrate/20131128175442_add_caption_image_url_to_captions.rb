class AddCaptionImageUrlToCaptions < ActiveRecord::Migration
  def change
    add_column :captions, :caption_image_rul, :text
  end
end
