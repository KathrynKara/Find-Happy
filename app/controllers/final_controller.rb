class FinalController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]

  def index
    @tags = Tag.all
  end
end
