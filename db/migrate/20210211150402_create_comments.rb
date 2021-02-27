class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, null: true, foreign_key: { to_table: :users }
      t.references :video, null: true, foreign_key: { to_table: :videos }
      t.references :new, null: true, foreign_key: { to_table: :news }
      t.text :comment
      t.string :locale
      t.boolean :deleted, default: false
      t.timestamps
    end
  end
end
