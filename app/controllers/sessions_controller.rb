class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_nickname(params[:session][:nickname])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome back #{user.nickname}."
    else
      flash.now[:error] = "Invalid credentials"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been logged out."
  end
end
