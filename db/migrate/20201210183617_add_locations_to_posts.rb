class AddLocationsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :origin, :string
    add_column :posts, :destination, :string
  end
end
