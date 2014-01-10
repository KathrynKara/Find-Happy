class SearchController < ApplicationController
  def index
    query = params[:q]
    @tags = Tag.where('title ILIKE :query
      OR comment ILIKE :query', 
      query: "%#{query}%")
  end
end
