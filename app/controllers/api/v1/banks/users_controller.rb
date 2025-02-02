class Api::V1::Banks::UsersController < ApplicationController
  def index
    render json: { data: UserBlueprint.render_as_hash(users) }
  end

  private

  def bank
    @bank ||= Bank.find(params[:id])
  end

  def users
    @users ||= bank.users
  end
end
