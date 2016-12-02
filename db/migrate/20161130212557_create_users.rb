class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
      t.integer :receiver_id
      t.string :exceptions
      t.string :password_digest
      t.boolean :is_admin
      t.boolean :is_taken

      t.timestamps null: false
    end
  end
end
