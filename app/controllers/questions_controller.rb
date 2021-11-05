class QuestionsController < ApplicationController
  def index
    @question = Question.all
  end
  def show
    @question = Question.all
  end

  def new
    @question = Question.new
  end
  def create
    @question = Question.new(user_params)
    if @question.save
      redirect_to index_path
    else
      render :new
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to index_path
  end
  private

  def user_params
    params.require(:question).permit(:question, :evaluation_forms_id)
  end
end
