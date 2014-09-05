class AddUserIdToHashtag < ActiveRecord::Migration
  def change
    add_column :hashtags, :user_id, :integer
  end
end
