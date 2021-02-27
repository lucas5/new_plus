class AdminsBackoffice::NewsController < AdminsBackofficeController
  before_action :set_new, only: [:edit, :update, :destroy]

  def index
    @news = New.not_excluded
  end
  
  # GET /news/1
  def show
  end

  # GET /news/new
  def new
    @new = New.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  def create
    @new = New.new(new_params)
    if @new.save
      redirect_to admins_backoffice_news_index_path, notice: "Notícia cadastrada"
    else
      render :new
    end
  end

  # PATCH/PUT /admins/1
  def update
    if @new.update(new_params)
      redirect_to admins_backoffice_news_index_path(@new), notice: "Notícia atualizada"
    else
      render :edit
    end
  end

  # DELETE /news/1
  def destroy
    @new.update_attribute(:deleted, true)
    redirect_to admins_backoffice_news_index_path, notice: "Notícia apagada"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_new
    @new = New.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def new_params
    params.fetch(:new).permit(:title, :description, :date_news,
                                  tag_news_attributes: [:id, :new_id, :tag_id, :_destroy])
  end
end
