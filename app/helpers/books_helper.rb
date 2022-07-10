module BooksHelper
  def removeString(baseText, string)
    baseText.gsub(/#{string}/, '')
  end

  def getAvgScore(reviews)
    num = 0
    reviews.each do |r|
      num += r.score
    end
    score = num / reviews.count
  end

  def getProgressScore(reviews, type)
    count = 0
    reviews.each do |r|
      count += 1 if r.score.round == type
    end
    progress =  100 * count / reviews.count
  end
end
