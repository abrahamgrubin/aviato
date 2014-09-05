class CreateHashtaggings < ActiveRecord::Migration
  def change
    create_table :hashtaggings do |t|
      t.belongs_to :bookmark, index: true
      t.belongs_to :hashtag, index: true

      t.timestamps
    end
  end
end
