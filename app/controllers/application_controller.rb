class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  private

  def ensure_current_user_admin?
    return if current_user.roles.pluck(:name).include?('admin')
    flash[:danger] = 'you are not admin'
    redirect_to root_path
  end
end
