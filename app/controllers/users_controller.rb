class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @current_user = user

      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end


end
