class EvaluationFormsController < ApplicationController
  def index
    @evaluation_form =EvaluationForm.all.page params[:page]
    @user = current_user
  end

  def show
    @evaluation_form = EvaluationForm.find(params[:id])
  end

  def new
    @evaluation_form = EvaluationForm.new
    @user = current_user

  end

  def create
    if current_user.role != "HR"
       @total = Integer(params[:evaluation_form]["answer1"])+Integer(params[:evaluation_form]["answer2"])+Integer(params[:evaluation_form]["answer3"])+Integer(params[:evaluation_form]["answer4"])+Integer(params[:evaluation_form]["answer5"])+Integer(params[:evaluation_form]["answer6"])+Integer(params[:evaluation_form]["answer7"])+Integer(params[:evaluation_form]["answer8"])+Integer(params[:evaluation_form]["answer9"])+Integer(params[:evaluation_form]["answer10"])
    end
    @user = current_user
    @evaluation_form = EvaluationForm.new(user_params.merge(score: @total))
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
    params.require(:evaluation_form).permit(:answer1,:answer2,:answer3,:answer4,:answer5,:answer6,:answer7,:answer8,:answer9,:answer10, :submit_by, :comment, :user_id)
  end
end
