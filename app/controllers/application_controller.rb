class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in
    if Current.user.nil?
      redirect_to login_path, alert: "You must be logged in to do that."
    end
  end
end
