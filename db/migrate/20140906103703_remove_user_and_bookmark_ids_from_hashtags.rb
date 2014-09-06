class RemoveUserAndBookmarkIdsFromHashtags < ActiveRecord::Migration
  def up
    remove_column :hashtags, :user_id
    remove_column :hashtags, :bookmark_id
  end

  def down
    add_column :hashtags, :user_id
    add_column :hashtags, :bookmark_id
  end
end
