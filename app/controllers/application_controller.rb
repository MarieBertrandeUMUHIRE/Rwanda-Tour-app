class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    unless current_user
      redirect_to "/destinations"
      flash[:danger] = "Access Denied, you are Signed out!!"
    end
  end
end

