class RemoveJoinDateFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :join_date, :string
  end
end
