class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :home_address, :text
    add_column :users, :home_latitude, :string
    add_column :users, :home_longitude, :string
    add_column :users, :work_address, :text
    add_column :users, :work_latitude, :string
    add_column :users, :work_longitude, :string
  end
end
