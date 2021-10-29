class AddEvaluationFormToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :evaluation_forms, null: false, foreign_key: true
  end
end
