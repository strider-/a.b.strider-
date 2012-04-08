class UsersController < ApplicationController
  before_filter :authenticated, only: [:edit, :update]
  
  include ApplicationHelper

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_path, notice: "Profile updated."
    else
      flash.now[:error] = "Missing or invalid profile information!"
      render 'edit'
    end    
  end

  private

    def authenticated
      redirect_to root_path if current_user.nil?
    end
end
