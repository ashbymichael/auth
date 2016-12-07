class AddUserToThings < ActiveRecord::Migration
  def change
    add_column :things, :user_id, :integer
  end
end
