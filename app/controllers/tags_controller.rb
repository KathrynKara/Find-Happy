class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
    @categories = Category.all
    # comment form
  end

  def create
    @tag = Tag.create
    redirect_to @tag, notice: "Happy Place successfully added"
  end

  def show
    @tags = Tag.find params[:id]
  end
end
