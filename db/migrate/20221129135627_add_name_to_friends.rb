class AddNameToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :name, :text
  end
end
