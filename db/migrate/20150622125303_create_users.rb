class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :corporation
      t.string :token

      t.timestamps null: false
    end
    add_index :users, :token, unique: true
    add_index :users, :email, unique: true
  end
end
