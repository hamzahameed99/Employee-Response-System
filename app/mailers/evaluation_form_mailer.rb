class EvaluationFormMailer < ApplicationMailer

  def evaluation_form_created(user)
    @user = user
    mail(to: @user.email, subject: 'Form is created!!')
  end

  def hr_email(user)
    @user = user
    mail(to: @user.email, subject: 'Form is created!!')
  end

  def inform_employee(emp)
    @user = emp
    mail(to: @user.email, subject: 'Form is open')
  end

end
