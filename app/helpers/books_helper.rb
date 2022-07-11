module BooksHelper
  def removeString(baseText, string)
    baseText.gsub(/#{string}/, '')
  end

  def getProgressScore(reviews, type)
    count = 0
    return count if reviews.empty?
    reviews.each do |r|
      count += 1 if r.score.round == type
    end
    progress =  100 * count / reviews.count
  end

  def checkExistReview(reviews, book)
    reviewsArr = []
    reviews.each do |r|
      if r.book_id == book['id']
        reviewsArr.push(r)
      end
    end
    return reviewsArr
  end

  def checkFavorite(favorites, user)
    favorite_id = nil
    favorites.each do |f|
      if f.user_id == user.id
        favorite_id = f.id
        break
      end
    end
    return favorite_id
  end
end
