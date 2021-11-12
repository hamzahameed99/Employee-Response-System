class UsersController < ApplicationController
  #before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_index_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_index_path
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_index_path
  end

  # def correct_user
  #   @user = current_user.User.find_by(role: "HR")
  #   redirect_to users_index_path, notice: "Not accessible!" if @user.nil?
  # end

  private

  def user_params
    params.require(:user).permit(:name, :cnic, :email, :join_date, :role, :manager_id,:password )
  end

end


