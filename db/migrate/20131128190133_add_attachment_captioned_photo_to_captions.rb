class AddAttachmentCaptionedPhotoToCaptions < ActiveRecord::Migration
  def self.up
    change_table :captions do |t|
      t.attachment :captioned_photo
    end
  end

  def self.down
    drop_attached_file :captions, :captioned_photo
  end
end
