class RelationshipsController < ApplicationController
  #フォロー機能を作成・保存・削除する
  def create
    # current_user.follow(params[:user_id])
    current_user.follow(relationship_params)
    redirect_to request.referer
  end

  def destroy
    # current_user.unfollow(params[:user_id])
    current_user.unfollow(relationship_params)
    redirect_to request.referer
  end

  #フォロー・フォロワー一覧を表示する
  def followings
    # user = User.find(params[:user_id])
    user = User.find(relationship_params)
    @users = user.followings
  end

  def followers
    # user = User.find(params[:user_id])
    user = User.find(relationship_params)
    @users = user.followers
  end


  private
  def relationship_params
    params.require(:relationship).permit(:follower_id, :followed_id)
  end

end
