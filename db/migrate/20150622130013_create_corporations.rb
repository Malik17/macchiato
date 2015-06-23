class CreateCorporations < ActiveRecord::Migration
  def change
    create_table :corporations do |t|
      t.string :name
      t.string :division
      t.string :contact_first
      t.string :contact_last
      t.string :email
      t.string :token

      t.timestamps null: false
    end
  end
end
