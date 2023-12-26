class UserController < ApplicationController
  before_action :set_user
  def profile
    @user.update(views: (@user.views || 0 ) + 1)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
