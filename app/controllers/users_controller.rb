class UsersController < ApplicationController
  expose_decorated(:user, build_params: :user_params)
end
