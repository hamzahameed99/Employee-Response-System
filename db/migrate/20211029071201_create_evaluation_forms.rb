class CreateEvaluationForms < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluation_forms do |t|
      t.text :comment
      t.string :submit_by

      t.timestamps
    end
  end
end
