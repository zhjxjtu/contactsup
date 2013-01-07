class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :inviter_id
      t.integer :invitee_id
      t.string :email
      t.integer :status, default: 101
      t.string :token
      t.string :name
      t.string :tel
      t.string :org
      t.timestamps
    end
    
    add_index :contacts, :inviter_id
    add_index :contacts, :invitee_id
    add_index :contacts, [:inviter_id, :invitee_id], unique: true
    add_index :contacts, [:inviter_id, :email], unique: true
    
  end
end
