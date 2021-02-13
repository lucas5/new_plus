class UsersBackoffice::UsersController < UsersBackofficeController
  def index
    @users = User.no_banned.to_ary
    @users.delete(current_user)
  end
end
