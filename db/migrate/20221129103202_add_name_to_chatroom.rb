class AddNameToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :name, :text
  end
end
