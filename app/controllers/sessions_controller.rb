class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id

      redirect_to user_path(user)
    else
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
