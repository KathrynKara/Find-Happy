class TagsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    # @tags = Tag.all
    @tags = current_user.tags
  end

  def new
    @tag = Tag.new
    # comment
  end

  def create
    @tag = current_user.tags.create safe_tag
    if @tag.save
      redirect_to @tag, notice: "Happy Place successfully added"
    else
      render 'new'
    end
  end

  def show
    @tag = Tag.find params[:id]
  end

  def edit
    @tag = Tag.find params[:id]
  end

  def update
    @tag = current_user.tags.update safe_tag
    redirect_to @tag, notice: "Happy Place successfully updated"
  end

  private

  def safe_tag
    params.require(:tag).permit(:title, :category, :comment)
  end

end
