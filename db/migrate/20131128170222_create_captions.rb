class CreateCaptions < ActiveRecord::Migration
  def change
    create_table :captions do |t|
      t.string :text
      t.references :submission, index: true

      t.timestamps
    end
  end
end
