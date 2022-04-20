class PicturesController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update]
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    elsif @picture.save
      redirect_to pictures_path, notice: "作成しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
  @picture.destroy
  redirect_to pictures_path, notice:"削除しました！"
  end

  private

  def pictute_params
    params.require(:picture).permit(:image, :content)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
