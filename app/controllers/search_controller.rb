class SearchController < ApplicationController
  def index
    query = params[:q]
    # @tags = Tag.search_for query
  end
end
