namespace :sample do
  desc "TODO"
  task test: :environment do

    @employees = User.where(role: "Employee")
    @employees.each do |emp|
      join_date = emp.join_date
      add_days = join_date + 6.months

      if Date.today <= add_days
        puts "True"
        EvaluationFormMailer.inform_employee(emp).deliver
      end
    end

  end

end