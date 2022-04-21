class FavoritesController < ApplicationController
  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end
  #
  # def create
  #   favorite = current_user.favorites.create(picture_id)
  # end  
end
