class BooksController < ApplicationController
  before_action :correct_book,only: [:edit,:update]
  
  def index
    @books = Book.all
    @user = current_user
    # @user_data = current_user
    @book = Book.new
    # @book_favorite = Book.find(params[:id])
  end

  def show
     @book = Book.find(params[:id])
    # @bookのユーザー
     @user = @book.user
     @book_new = Book.new
     @book_comment = BookComment.new
  end

  # def new
  #   @book = Book.new
  #   redirect_to book_path(@book.id)
  # end
  
  def create
     # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # binding.pry
     # ２. データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      flash[:notice] = "Book was successfully created."
       # ３. ブック詳細画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
     @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end
  
   def correct_book
        @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
   end
  
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
   def book_comments_params
    params.require(:book_comments).permit(:user_comment)
   end
  
end
