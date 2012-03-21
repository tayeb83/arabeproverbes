class CreateProverbes < ActiveRecord::Migration
  def change
    create_table :proverbes do |t|
      t.string :Identifiant
      t.string :Corps
      t.string :Description
      t.integer :user_id

      t.timestamps
    end
  end
end
