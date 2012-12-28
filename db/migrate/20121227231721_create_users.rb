class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :token_s
      t.boolean :admin, default: false
      t.integer :status, default: 101
      t.string :token_u
      t.string :name
      t.string :org
      t.string :title
      t.string :email_pref
      t.string :tel_pref
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :token_s, unique: true
    
  end
end
