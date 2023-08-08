class BookmarksController < ApplicationController

  def new
    @bookmark
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
