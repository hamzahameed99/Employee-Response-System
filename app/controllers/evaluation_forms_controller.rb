class EvaluationFormsController < ApplicationController
  def index
    @evaluation_form =EvaluationForm.all
    @user = current_user
  end
  def show
    @evaluation_form = EvaluationForm.find(params[:id])
  end

  def edit

  end

  def update

  end
  def new
    @evaluation_form = EvaluationForm.new
    @user = current_user
  end

  def create
    @user = current_user
    @evaluation_form = EvaluationForm.new(user_params)
    if @evaluation_form.save
      redirect_to evaluation_forms_path
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
    params.require(:evaluation_form).permit(:answer1,:answer2,:answer3,:answer4,:answer5,:answer6,:answer7,:answer8,:answer9,:answer10, :submit_by, :user_id)
  end
end
