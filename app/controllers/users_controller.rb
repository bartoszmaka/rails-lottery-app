class UsersController < ApplicationController
  expose(:user, build_params: :user_params)
end
