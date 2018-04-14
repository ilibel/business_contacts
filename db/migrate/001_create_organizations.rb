class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :short_name, limit: 255
      t.string :full_name, limit: 255
      t.string :inn, limit: 255
      t.string :kpp, limit: 255
      t.string :ogrn, limit: 255
      t.string :bik, limit: 255
      t.string :bank_name, limit: 255
      t.string :payment_account, limit: 255
      t.string :correspondent_account, limit: 255
      t.string :ceo_name, limit: 255
      t.string :adress, limit: 255
      t.string :phones, limit: 255
      t.string :website, limit: 255
      t.string :email, limit: 255
      t.integer :main_manager_id, limit: 11
    end
    
    create_join_table :organizations, :projects do |t|
      t.index [:organization_id, :project_id]
      t.index [:project_id, :organization_id]
    end
  end
end
