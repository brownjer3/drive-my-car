class AddCarTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :car_make, :string
    add_column :posts, :car_model, :string
    add_column :posts, :car_year, :integer
  end
end
