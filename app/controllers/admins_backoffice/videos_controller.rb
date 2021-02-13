class AdminsBackoffice::VideosController < AdminsBackofficeController
  before_action :set_video, only: [:edit, :update, :destroy]

  def index
    @videos = Video.all
  end

  # GET /videos/1
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to admins_backoffice_videos_path, notice: "Video cadastrado"
    else
      render :new
    end
  end

  # PATCH/PUT /admins/1
  def update
    if @video.update(video_params)
      redirect_to admins_backoffice_videos_path, notice: "Video atualizado"
    else
      render :edit
    end
  end

  # DELETE /videos/1
  def destroy
    @video.destroy
    redirect_to admins_backoffice_videos_path, notice: "Video apagado"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def video_params
    params.fetch(:video).permit(:url, :title, :description, :duration,
                                tag_videos_attributes: [:id, :video_id, :tag_id, :_destroy])
  end
end
