class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
def store_location
  session[:return_to] = request.fullpath if request.get? and controller_name != "user_sessions" and controller_name != "sessions"
end

def redirect_back_or_default(default)
  redirect_to(session[:return_to] || default)
end
  
end
