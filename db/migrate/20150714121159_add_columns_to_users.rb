class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :login, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :address, :string
  end
end
