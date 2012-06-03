class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string

    add_column :users, :name, :string

    add_column :users, :country, :string

    add_column :users, :birthday, :date

  end
end
