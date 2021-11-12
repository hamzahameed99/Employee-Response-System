class AddColumnToEvaluationForms < ActiveRecord::Migration[6.1]
  def change
    add_column :evaluation_forms, :score, :integer
  end
end
