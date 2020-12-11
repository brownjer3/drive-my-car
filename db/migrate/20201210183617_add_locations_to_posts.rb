class AddLocationsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :origin_id, :integer
    add_column :posts, :destination_id, :integer
  end
end
