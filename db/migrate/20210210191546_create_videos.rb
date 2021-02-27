class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :url
      t.text :description
      t.string :title
      t.float :duration
      t.boolean :deleted, default: false
      t.timestamps
    end
  end
end
