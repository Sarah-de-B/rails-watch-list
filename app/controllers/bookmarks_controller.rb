class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  # def create
  #   @list = List.find(params[:list_id])
  #   @bookmark = @list.bookmarks.new(book_params)
  #   if @bookmark.save
  #     redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
  #   else
  #     render :new
  #   end
  # end


  def create
    @bookmark = Bookmark.new(book_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    # @bookmark.movie = Movie.find(params[:bookmark][:movie_id]) if params[:bookmark][:movie_id].present?
    if @bookmark.save
      redirect_to list_path(@list), notice: 'bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Bookmark was successfully deleted.'
  end

  private


  def book_params
    params.require(:bookmark).permit(:comment, :movie_id, :created_at, :updated_at)
  end
end
