class AddResponsesToEvaluationForms < ActiveRecord::Migration[6.1]
  def change
    add_column :evaluation_forms, :responses, :string
  end
end
