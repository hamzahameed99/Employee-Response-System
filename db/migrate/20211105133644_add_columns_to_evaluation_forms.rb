class AddColumnsToEvaluationForms < ActiveRecord::Migration[6.1]
  def change
    add_column :evaluation_forms, :answer1, :string
    add_column :evaluation_forms, :answer2, :string
    add_column :evaluation_forms, :answer3, :string
    add_column :evaluation_forms, :answer4, :string
    add_column :evaluation_forms, :answer5, :string
    add_column :evaluation_forms, :answer6, :string
    add_column :evaluation_forms, :answer7, :string
    add_column :evaluation_forms, :answer8, :string
    add_column :evaluation_forms, :answer9, :string
    add_column :evaluation_forms, :answer10, :string
  end
end
