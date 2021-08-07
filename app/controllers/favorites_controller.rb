class FavoritesController < ApplicationController
before_action :authenticate_user!

  
  
def create
  #  bookのidをuser.idと設定している
  @book = Book.find(params[:book_id])
  favorite = @book.favorites.new(user_id: current_user.id)
  favorite.save
  # book詳細ページ、開いていたbookの
  # redirect_to book_path(@book.id)
  redirect_to request.referer
end

def destroy
  @book = Book.find(params[:book_id])
  favorite = @book.favorites.find_by(user_id: current_user.id)
  favorite.destroy
  # redirect_to book_path(@book.id) 
  redirect_to request.referer
end

end
