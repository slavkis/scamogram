class UsersController < ApplicationController
  before_action :take_all_users, only: [:index, :show]

  def index
  end
  
  def show
    @user = User.find(params[:id])
  end

  private

  def take_all_users
    @users = User.all
  end
end
