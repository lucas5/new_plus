class UsersBackoffice::NewsController < UsersBackofficeController
  def index
    @news = New.news_search(params[:search])
  end

  def edit
    @new = New.find(params[:id])
    @comments = Comment.where(new_id: @new.id, locale: params[:locale]).order(created_at: :desc)
    @rating = Rating.where(user_id: current_user.id, new_id: @new.id).last

    create_comment params[:comments], @new.id
    create_rating params[:rating], @new.id
  end

  private

  def create_comment(comment, item_id)
    if comment.present? and comment != ''
      _comment = Comment.new({user_id: current_user.id, comment: comment, new_id: item_id, locale: params[:locale]})
      if _comment.save
        redirect_to edit_users_backoffice_news_path(item_id), notice: "Comentário cadastrado"
      end
    end
  end

  def create_rating(rating, item_id)
    if rating.present? and rating != ''
      _rating = Rating.new({user_id: current_user.id, rate: rating, new_id: item_id})
      if _rating.save
        redirect_to edit_users_backoffice_news_path(item_id), notice: "Avaliação cadastrada"
      end
    end
  end
end
