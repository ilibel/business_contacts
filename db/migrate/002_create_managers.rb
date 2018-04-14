class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.references :organization, index: true, foreign_key: true
      t.string :first_name, limit: 255
      t.string :middle_name, limit: 255
      t.string :last_name, limit: 255
      t.date :birthday
      t.string :phone, limit: 255
      t.string :email, limit: 255
    end
  end
end
