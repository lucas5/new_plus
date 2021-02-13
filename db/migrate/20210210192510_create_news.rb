class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :title, index: true
      t.text :description, index: true
      t.date :date_news
      t.timestamps
    end
  end
end
