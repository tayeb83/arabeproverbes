
	class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :proverbe

      t.timestamps
    end
    add_index :comments, :proverbe_id
  end
end
