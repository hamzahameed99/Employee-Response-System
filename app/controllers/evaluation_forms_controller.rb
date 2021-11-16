class EvaluationFormsController < ApplicationController
  def index
    @evaluation_form =EvaluationForm.all.page params[:page]
    @user = current_user
  end

  def show
    @question_array = Query.pluck(:question)
    @evaluation_form = EvaluationForm.find(params[:id])
  end

  def new
    @question_array = Query.pluck(:question)

    @evaluation_form = EvaluationForm.new
    @user = current_user
  end

  def create

    @question_array = Query.pluck(:question)
    final_answer = ""
    @question_array.each_with_index do |q,i|
      final_answer += String(params[:evaluation_form]["answer-#{i}"]) + ","
    end



    if current_user.role != "HR"
      total = 0
      @question_array.each_with_index do |q,i|
        total += Integer(params[:evaluation_form]["answer-#{i}"])
      end
    end

    @user = current_user

    @evaluation_form = EvaluationForm.new(user_params.merge(responses: final_answer, score: total))
    if @evaluation_form.save
      if current_user.role == "Employee"
        current_manager = User.find(current_user.manager_id)

        EvaluationFormMailer.evaluation_form_created(current_manager).deliver_now
        redirect_to users_index_path

      elsif current_user.role == "Manager"
        @user = User.find_by_role("HR")
        EvaluationFormMailer.hr_email(@user).deliver_now
        redirect_to users_index_path

      elsif current_user.role == "HR"
        for_employee = User.find(@evaluation_form.user_id)
        EvaluationFormMailer.evaluation_form_created(for_employee).deliver_now
        redirect_to users_index_path
      end
    else
      render :new
    end
  end

  def destroy
    EvaluationForm.find(params[:id]).destroy
    redirect_to evaluation_forms_index_path, notice: "Form deleted."
  end

  private

  def user_params
    params.require(:evaluation_form).permit( :submit_by, :comment, :user_id)
  end
end
