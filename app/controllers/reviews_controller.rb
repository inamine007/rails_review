class ReviewsController < ApplicationController
  def index
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:notice] = "レビューを作成しました。"
    else
      flash[:danger] = @review.errors.full_messages
    end

    redirect_back(fallback_location: root_path)
  end

  def update
    review = Review.find(params[:id])
    review.update!(review_params)

    flash[:notice] = "レビューを編集しました。"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy

    flash[:notice] = "レビューを削除しました。"
    redirect_back(fallback_location: root_path)
  end

  private
  def review_params
    params.require(:review).permit(:book_id, :title, :score, :content, :user_id)
  end
end
