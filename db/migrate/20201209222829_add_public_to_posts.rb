class AddPublicToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :public, :boolean, null: false, default: true
  end
end
