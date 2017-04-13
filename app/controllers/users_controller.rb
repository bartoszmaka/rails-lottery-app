class UsersController < ApplicationController
  expose_decorated(:user, build_params: :user_params)
  # expose(:users) { User.all.page(params[:page]) }

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
end
