class BookmarksController < ApplicationController
    def new
      @list = List.find(params[:list_id])
      @bookmark = Bookmark.new
    end

    def create
      @list = List.find(params[:id])
      @bookmark = Bookmark.new(bookmark_params)

       if @bookmark.save
        redirect_to @list, notice: "created"
       else
        render :new
       end
    end

    def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
      redirect_to @list
    end
    
    private

    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
    end
end
