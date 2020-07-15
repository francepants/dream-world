class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :title
      t.date :date
      t.string :genre
      t.text :dream
      t.string :theme
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
