class UsersBackofficeController < ApplicationController
  before_action :is_banned
  before_action :authenticate_user!

  layout 'users_backoffice'

  def is_banned
    sign_out current_user if current_user.banned
  end

  def accept_friend_request
    byebug
    friend = Friend.new({user_id: current_user.id, friend_id: params[:friend_id]})
    friend.save
  end

end
