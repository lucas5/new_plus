class AdminsBackoffice::UsersController < AdminsBackofficeController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.where(is_admin: true).not_excluded
  end

  def index_user
    @users = User.where(is_admin: false).not_excluded
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admins_backoffice_users_path, notice: "User cadastrado"
    else
      render :new
    end
  end

  def ban_user
    user = User.find(params[:id]).update_column(:banned, true)
    if user
      redirect_to admins_backoffice_only_users_path
    end
  end

  def remove_ban
    user = User.find(params[:id]).update_column(:banned, false)
    if user
      redirect_to admins_backoffice_only_users_path
    end
  end

  # PATCH/PUT /admins/1
  def update
    if @user.update(user_params)
      redirect_to edit_admins_backoffice_user_path(@user), notice: "User atualizado"
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.update_attribute(:deleted, true)
    redirect_to admins_backoffice_only_users_path, notice: "User apagado"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user).permit(:name, :email, :is_admin, :password)
  end
end
