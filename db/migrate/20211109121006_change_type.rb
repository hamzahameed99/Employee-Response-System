class ChangeType < ActiveRecord::Migration[6.1]
  def change
    change_column :evaluation_forms, :answer1, :integer, using: 'answer1::integer'
    change_column :evaluation_forms, :answer2, :integer, using: 'answer2::integer'
    change_column :evaluation_forms, :answer3, :integer, using: 'answer3::integer'
    change_column :evaluation_forms, :answer4, :integer, using: 'answer4::integer'
    change_column :evaluation_forms, :answer5, :integer, using: 'answer5::integer'
    change_column :evaluation_forms, :answer6, :integer, using: 'answer6::integer'
    change_column :evaluation_forms, :answer7, :integer, using: 'answer7::integer'
    change_column :evaluation_forms, :answer8, :integer, using: 'answer8::integer'
    change_column :evaluation_forms, :answer9, :integer, using: 'answer9::integer'
    change_column :evaluation_forms, :answer10, :integer, using: 'answer10::integer'
  end
end
