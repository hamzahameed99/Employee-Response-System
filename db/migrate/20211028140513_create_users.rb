class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :cnic
      t.string :email
      t.string :join_date
      t.string :role

      t.timestamps
    end
  end
end
