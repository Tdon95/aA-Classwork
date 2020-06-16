class CreateUsers1 < ActiveRecord::Migration[6.0]
  def change
    create_table :users1s do |t|
      add_index :users, :email
      t.string :email, null: false
      

      t.timestamps
    end
  end
end
