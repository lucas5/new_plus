class AdminsBackoffice::CommentsController < AdminsBackofficeController
  def index
    @users = User.where(is_admin: false).not_excluded
  end

  def comments_by_user
    @comments = Comment.where(user_id: params[:user_id], deleted: false).not_excluded
  end

  def delete_comment
    comment = Comment.not_excluded.find(params[:id])
    user_id = comment.user_id
    if comment.update_attribute(:deleted, true)
      redirect_to admins_backoffice_get_comments_path(user_id), notice: "Comentário apagado"
    end
  end
end
