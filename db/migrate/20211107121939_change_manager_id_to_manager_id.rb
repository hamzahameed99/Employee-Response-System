class ChangeManagerIdToManagerId < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :managerid, :manager_id
  end
end
