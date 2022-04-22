class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = current_user.pictures.build(picture_params)
    else
      @picture = current_user.pictures.build
    end
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    elsif @picture.save
      # PicturePostMailer.picturepost_mail(current_user).deliver
      redirect_to pictures_path, notice: "作成しました！"
    else
      render :new
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
    if @picture.user == current_user
      render "edit"
    else
      redirect_to pictures_path
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def confirm
      @picture = current_user.pictures.build(picture_params)
      render :new if @picture.invalid?
  end

  def destroy
    if @picture.user == current_user
      @picture.destroy
      redirect_to pictures_path, notice:"削除しました！"
    else
      redirect_to pictures_path
    end
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

end
