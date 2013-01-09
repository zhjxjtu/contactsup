class AddEmailsAndTelsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :email_work, :string
  	add_column :users, :email_home, :string
  	add_column :users, :tel_cell, :string
  	add_column :users, :tel_work, :string
  	add_column :users, :tel_home, :string
  end
end
