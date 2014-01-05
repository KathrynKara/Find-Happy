class TagsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit]
  before_action :set_tag, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    @tag.update_attributes safe_tag
    redirect_to @tag, notice: "Happy Place successfully updated"
  end

  private

  def set_tag
    @tag = Tag.find params[:id]
  end

  def safe_tag
    params.require(:tag).permit(:title, :category, :comment)
  end

end
