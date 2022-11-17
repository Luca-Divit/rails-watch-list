class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_parameters)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy!
    redirect_to list_path(List.find_by(id: @bookmark.list_id).id)
  end

  private

  def bookmark_parameters
    params.require(:bookmark).permit(
      :comment,
      :movie_id
    )
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
