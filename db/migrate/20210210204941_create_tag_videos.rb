class CreateTagVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_videos do |t|
      t.references :video, null: true, foreign_key: { to_table: :videos }
      t.references :tag, null: true, foreign_key: { to_table: :tags }
      t.timestamps
    end
  end
end
