module BooksHelper
  def removeString(baseText, string)
    baseText.gsub(/#{string}/, '')
  end
end
