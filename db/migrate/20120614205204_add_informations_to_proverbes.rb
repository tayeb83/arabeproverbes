class AddInformationsToProverbes < ActiveRecord::Migration
  def change
  add_column :proverbes, :proverbe_histoire,:string
  add_column :proverbes, :proverbe_sens,:string	
  end
end
