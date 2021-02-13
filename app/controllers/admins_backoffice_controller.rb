class AdminsBackofficeController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin
  layout 'admins_backoffice'

  def is_admin
    redirect_to(users_backoffice_welcome_index_path,
    notice: 'Necessário existir uma internação em aberto') unless current_user.is_admin
  end
end
