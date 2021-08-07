class BookCommentsController < ApplicationController
  # before_action :correct_book_comment,only: [:destroy]
  before_action :authenticate_user!

  
  
  def create
     @book = Book.find(params[:book_id])
    # 空のコメントを作る
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    # ユーザーのidを指定する
    @book_comment.user_id = current_user.id    
  
    # 同じならsave
    if @book_comment.save
      redirect_to book_path(@book.id)
    else
      render 'books/show'
    end
    
  end
  
  def destroy
    # book_commentを特定する
    @book = Book.find(params[:book_id])
  	book_comment = @book.book_comments.find(params[:id])
    book_comment.destroy
    redirect_to book_path(@book.id)
    # redirect_to request.referer
  end
  
  # def correct_book_comment
  #   @book_comment = Book_comments.find(params[:id])
  #   unless @book_comment.user.id == current_user.id
  #     # どこに飛ばせばいいかわからない
  #     # redirect_to books_path
  #     redirect_to book_path(book_comment.book)
  #   end
  # end
    
  private
  def book_comment_params
    params.require(:book_comment).permit(:user_comment)
  end  
end