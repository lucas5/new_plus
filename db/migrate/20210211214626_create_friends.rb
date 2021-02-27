class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :friend, null: true, foreign_key: { to_table: :users }
      t.boolean :deleted, default: false
      t.timestamps
    end
  end
end
