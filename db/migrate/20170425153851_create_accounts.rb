class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps null: false
    end
    
    add_index :accounts, [:user_id, :name]
  end
end
