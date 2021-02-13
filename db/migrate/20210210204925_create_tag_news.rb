class CreateTagNews < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_news do |t|
      t.references :new, null: true, foreign_key: { to_table: :news }
      t.references :tag, null: true, foreign_key: { to_table: :tags }
      t.timestamps
    end
  end
end
