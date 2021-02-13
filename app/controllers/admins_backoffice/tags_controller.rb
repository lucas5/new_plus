class AdminsBackoffice::TagsController < AdminsBackofficeController
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  # GET /tags/1
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admins_backoffice_tags_path, notice: "Tag cadastrado"
    else
      render :new
    end
  end

  # PATCH/PUT /admins/1
  def update
    if @tag.update(tag_params)
      redirect_to admins_backoffice_tags_path(@tag), notice: "Tag atualizado"
    else
      render :edit
    end
  end

  # DELETE /tags/1
  def destroy
    @tag.destroy
    redirect_to admins_backoffice_tags_path, notice: "Tag apagado"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tag
    @tag = Tag.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tag_params
    params.fetch(:tag).permit(:name, :description)
  end
end
