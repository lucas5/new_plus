class AdminsBackoffice::CommentsController < AdminsBackofficeController
  def index
    @users = User.where(is_admin: false)
  end

  def comments_by_user
    @comments = Comment.where(user_id: params[:user_id])
  end

  def delete_comment
    comment = Comment.find(params[:id])
    user_id = comment.user_id
    if comment.destroy
      redirect_to admins_backoffice_get_comments_path(user_id), notice: "Comentário apagado"
    end
  end
end
