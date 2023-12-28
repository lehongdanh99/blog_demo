class ApplicationController < ActionController::Base
  before_action :set_notification, if: :current_user
  private

  def set_notification
    notification = Notification.where(recipient: current_user).newest_first.limit(9)
    @unread = notification.unread
    @read = notification.read
  end
end
