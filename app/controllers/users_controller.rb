class UsersController < ApplicationController
  before_action :correct_user,only: [:edit,:update]
  
  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
     @user = User.find(params[:id])
     @book = Book.new
     @books = @user.books
  end

  # def new
  #   @book = Book.new
  # end
  
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     flash[:notice] = "Welcome! You have signed up successfully."
  #     # ユーザー詳細ページに飛ばす
  #     redirect_to user_path(@user.id)
  #   else
  #     @users = User.all
  #     # サインアップの入力ページ
  #     render 'index'
  #   end
  # end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      # ユーザー詳細ページに飛ばす
      redirect_to user_path(@user.id)
    else
      @users = User.all
      # ユーザー編集ページに飛ばす
      render :edit
    end
  end
  
  # def destroy
  #   user = User.find(params[:id])
  #   user.destroy
  #   flash[:notice] = "Book was successfully destroyed."
  #   redirect_to users_path
  # end
  
  
   
  
  def correct_user
        @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
  
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end
