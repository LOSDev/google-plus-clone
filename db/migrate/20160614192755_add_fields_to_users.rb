class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false
    add_index :users, :username, unique: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :tagline, :string
    add_column :users, :is_admin, :boolean, null: false, default: false
  end
end
