# Preview all emails at http://localhost:3000/rails/mailers/evaluation_form_mailer
class EvaluationFormMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/evaluation_form_mailer/evaluation_form_created
  def evaluation_form_created
    EvaluationFormMailer.evaluation_form_created(user)
  end

end
