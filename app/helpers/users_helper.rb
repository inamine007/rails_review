module UsersHelper
  def checkExistFavoriteReview(reviews, book)
    reviewsArr = []
    reviews.each do |r|
      if r.book_id == book.book_id
        reviewsArr.push(r)
      end
    end
    return reviewsArr
  end
end
