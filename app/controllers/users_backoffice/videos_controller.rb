class UsersBackoffice::VideosController < UsersBackofficeController
  def index
    @videos = Video.all
  end

  def edit
    @video = Video.find(params[:id])
    @comments = Comment.where(video_id: @video.id, locale: params[:locale]).order(created_at: :desc)
    @rating = Rating.where(user_id: current_user.id, video_id: @video.id).last

    create_comment params[:comments], @video.id
    create_rating params[:rating], @video.id
  end

  private

  def create_comment(comment, item_id)
    if comment.present? and comment != ''
      _comment = Comment.new({user_id: current_user.id, comment: comment, video_id: item_id, locale: params[:locale]})
      if _comment.save
        redirect_to edit_users_backoffice_video_path(item_id), notice: "Comentário cadastrado"
      end
    end
  end

  def create_rating(rating, item_id)
    if rating.present? and rating != ''
      _rating = Rating.new({user_id: current_user.id, rate: rating, video_id: item_id})
      if _rating.save
        redirect_to edit_users_backoffice_video_path(item_id), notice: "Avaliação cadastrada"
      end
    end
  end
end
