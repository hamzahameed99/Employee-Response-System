class HomeController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to home_index_path
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
      flash[:success] = "Record updated successfully!"
      redirect_to root_path
    else
      flash.now[:error] = "To-do item update failed"
      render :edit
    end
  end

  def destroy
    if current_user.role == "HR"
      User.find(params[:id]).destroy
      redirect_to root_path
    end
  end
  def show
    #@user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :cnic, :email, :join_date, :role, :managerid,:password )
  end

end


