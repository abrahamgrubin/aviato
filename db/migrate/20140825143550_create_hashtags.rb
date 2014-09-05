class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :name
      t.belongs_to :bookmark, index: true

      t.timestamps
    end
  end
end
