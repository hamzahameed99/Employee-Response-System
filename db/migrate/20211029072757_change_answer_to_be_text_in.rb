class ChangeAnswerToBeTextIn < ActiveRecord::Migration[6.1]
  def change
    change_column :questions, :answer, :text
  end
end
