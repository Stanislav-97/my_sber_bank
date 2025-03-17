class Api::V1::UsersController < ApplicationController
  def index
    render json: { data: UserBlueprint.render_as_hash(users) }
  end

  private

  def users
    @users ||= User.all
  end
end
