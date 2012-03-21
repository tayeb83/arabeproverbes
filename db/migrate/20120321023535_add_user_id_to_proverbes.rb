class AddUserIdToProverbes < ActiveRecord::Migration
  def change
    add_column :proverbes, :user_id, :integer

  end
end
