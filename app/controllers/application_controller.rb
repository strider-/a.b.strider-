class ApplicationController < ActionController::Base
  protect_from_forgery

  private

    def authenticated
      redirect_to root_path if current_user.nil?
    end
end
