class TagsController < ApplicationController
  def index
    @tags = current_user.tags
  end

  def new
    @tag = Tag.new
    # @categories = Category.all
    # comment
  end

  def create
    safe_tag = params.require(:tag).permit(:title, :category, :comment)
    @tag = current_user.tags.create safe_tag
    redirect_to @tag, notice: "Happy Place successfully added"
  end

  def show
    @tag = Tag.find params[:id]
  end

  def edit
    @tag = Tag.find params[:id]
  end

  def update
    safe_tag = params.require(:tag).permit(:title, :category, :comment)
    @tag = current_user.tags.create safe_tag
    redirect_to @tag, notice: "Happy Place successfully updated"
  end
end
