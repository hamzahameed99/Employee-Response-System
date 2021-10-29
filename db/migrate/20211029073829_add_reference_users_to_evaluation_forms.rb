class AddReferenceUsersToEvaluationForms < ActiveRecord::Migration[6.1]
  def change
    add_reference :evaluation_forms, :users, index: true
  end
end
