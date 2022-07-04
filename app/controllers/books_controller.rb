class BooksController < ApplicationController
  def index
    searchString = 'Rails'
    maxNum = 12
    uri = URI.parse("https://www.googleapis.com/books/v1/volumes")
    query = { 'q' => searchString, 'maxResults' => maxNum }
    uri.query = URI.encode_www_form(query)
    response = Net::HTTP.get_response(uri)
    @results = JSON.parse(response.body)
  end

  def show
    bookId = params[:id]
    uri = URI.parse("https://www.googleapis.com/books/v1/volumes/#{bookId}")
    response = Net::HTTP.get_response(uri)
    result = JSON.parse(response.body)
    @title = result['volumeInfo']['title']
    @publishedDate = result['volumeInfo']['publishedDate']
    @author =  result['volumeInfo']['authors'][0]
    @description = result['volumeInfo']['description']
    @thumbnail = result['volumeInfo']['imageLinks']['smallThumbnail']
  end
end
