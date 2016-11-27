class UserController < ApplicationController
  before_filter :store_current_location, :unless => :devise_controller?

  def store_current_location
    store_location_for(:adin, request.url)
  end

  def become
    session[:return_to] ||= request.referer
    @user=User.find(params[:id])

    sign_in(:user, User.find(params[:id]))
    redirect_to root_path
  end 
def show

    @user=User.find(params[:id])
end
end