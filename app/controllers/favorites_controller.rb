class FavoritesController < ApplicationController
  def index
  end

  def create
    favorite = Favorite.new(favorite_params)

    if favorite.save
      flash[:notice] = "お気に入りに保存しました。"
    else
      flash[:danger] = favorite.errors.full_messages
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy

    flash[:notice] = "お気に入りから削除しました。"
    redirect_back(fallback_location: root_path)
  end

  private
  def favorite_params
    params.require(:favorite).permit(:book_id, :user_id, :book_name, :author_name, :book_image)
  end

end
