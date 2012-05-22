class CreateLikerelations < ActiveRecord::Migration
  def  self.up
    create_table :likerelations do |t|
      t.integer :user_id
      t.integer :proverbe_id

      t.timestamps
    end

    add_index :likerelations, :user_id
    add_index :likerelations, :proverbe_id
    add_index :likerelations, [:user_id, :proverbe_id], :unique => true

  end
end
