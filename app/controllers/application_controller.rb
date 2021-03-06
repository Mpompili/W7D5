class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def loggedin?
    !!current_user
  end

  def login(user)
    session[:session_token] = user.reset_session_token
  end

  def logout
    current_user.reset_session_token
    session[:session_token] = nil
    @current_user = nil 
  end

  def require_login

  end
end
