class RelationshipsController < ApplicationController
  #フォロー機能を使う時
  def create
    current_user.follow(params[:user_id])
    # current_user.follow(relationship_params)
    redirect_to request.referer
  end

  #フォロー機能を無効にする時
  def destroy
    current_user.unfollow(params[:user_id])
    # current_user.unfollow(relationship_params)
    redirect_to request.referer
  end

  #フォロー一覧を表示する時
  def followings
    user = User.find(params[:user_id])
    # user = User.find(relationship_params)
    @users = user.followings
  end

  #・フォロワー一覧を表示する時 
  def followers
    user = User.find(params[:user_id])
    # user = User.find(relationship_params)
    @users = user.followers
  end



  # private
  # def relationship_params
  #   params.require(:relationship).permit(:follower_id, :followed_id)
  # end

end
