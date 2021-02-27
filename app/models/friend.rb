class Friend < ApplicationRecord
  belongs_to :user, class_name: 'User'

  scope :friend_request, -> (user_id, friend_id) do
    where(user_id: user_id, friend_id: friend_id)
  end

  scope :not_excluded, -> { where(deleted: false); order(:id) }

  # 0 -> user and friend are not friends
  # 1 -> friend not accepted request friendship
  # 2 -> user and friend are friends
  def self.verify_friendship(user_id, friend_id)
    request = friend_request(user_id, friend_id).count
    accepted = friend_request(friend_id, user_id).count
    case (true)
    when (request > 0 and accepted > 0)
      return 2
    when (request > 0 and accepted == 0)
      return 1
    else
      return 0
    end
  end

  def self.friends_request(user_id)
    friends = []
    user_friends = where(friend_id: user_id).select(:user_id).distinct
    user_friends.each do |user|
      list_friend = friend_request(user_id, user.user_id)
      friends.push user if list_friend.size == 0
    end
    friends
  end

  def self.get_friend_list(user_id)
    friends = []
    user_friends = where(user_id: user_id)
    user_friends.each do |user|
      list_friend = friend_request(user.friend_id, user_id)
      friends.push user if list_friend.size > 0
    end
    friends
  end

end
