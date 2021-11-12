require "test_helper"

class EvaluationFormMailerTest < ActionMailer::TestCase
  test "evaluation_form_created" do
    mail = EvaluationFormMailer.evaluation_form_created(user)
    assert_equal "Evaluation form created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
