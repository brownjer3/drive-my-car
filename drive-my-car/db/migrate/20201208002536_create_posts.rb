class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :desc
      t.integer :s_location
      t.integer :e_location
      t.datetime :end_date
      t.timestamps null: false
    end
  end
end
