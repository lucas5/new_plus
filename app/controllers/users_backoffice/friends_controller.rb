class UsersBackoffice::FriendsController < UsersBackofficeController
  def accept_friend_request
    friend = Friend.new({user_id: current_user.id, friend_id: params[:friend_id]})
    if friend.save
      redirect_to users_backoffice_users_path
    end
  end

  def cancel_friend_request
    friend = Friend.friend_request(current_user.id, params[:friend_id]).last
    if friend.destroy
      redirect_to users_backoffice_users_path
    end
  end

  def undo_friendship
    friend = Friend.friend_request(current_user.id, params[:friend_id]).last
    request = Friend.friend_request(params[:friend_id], current_user.id).last
    if friend.destroy and request.destroy
      redirect_to users_backoffice_users_path
    end
  end

  def send_friend_request
    friend = Friend.new({ user_id: current_user.id, friend_id: params[:friend_id]})
    if friend.save
      redirect_to users_backoffice_users_path
    end
  end

  def verify_friendship
    Friend.verify_friendship(current_user.id, params[:friend_id])
  end
end
