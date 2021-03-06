class TagsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :show, :create, :edit, :delete]
  before_action :set_tag, only: [:show, :edit, :update, :delete]

  def index
    # @tags = Tag.all
    @tags = current_user.tags
  end

  def new
    @tag = Tag.new
    # comment
  end

  def create
    @tag = Tag.new safe_tag
    @tag.user = current_user
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

  def destroy
    Tag.destroy(params[:id])
    flash[:notice]= "Successfully deleted Happy Place"
    redirect_to tags_path
  end



  private

  def set_tag
    @tag = Tag.find params[:id]
  end

  def safe_tag
    params.require(:tag).permit(:title, :category, :comment, :address)
  end

end
