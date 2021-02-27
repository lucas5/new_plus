class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :video, null: true, foreign_key: { to_table: :videos }
      t.references :new, null: true, foreign_key: { to_table: :news }
      t.integer :rate, null: false
      t.boolean :deleted, default: false
      t.timestamps
    end
  end
end
