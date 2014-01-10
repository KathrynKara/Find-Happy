class SearchController < ApplicationController
  def index
    query = params[:q]
    @tags = Tag.where('title LIKE :query
      OR comment LIKE :query', 
      query: "%#{query}%")
  end
end
