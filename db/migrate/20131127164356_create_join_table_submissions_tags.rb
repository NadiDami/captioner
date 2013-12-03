class CreateJoinTableSubmissionsTags < ActiveRecord::Migration
  def change
    create_join_table :submissions, :tags do |t|
      # t.index [:submission_id, :tag_id]
      # t.index [:tag_id, :submission_id]
    end
  end
end
