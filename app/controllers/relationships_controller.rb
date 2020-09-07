class RelationshipsController < ApplicationController

  def create
    following = current_user.follow(params[:follow_id])
    following.save
    redirect_to request.referer
  end

  def destroy
    following = current_user.unfollow(params[:follow_id])
    following.destroy
   	redirect_to request.referer
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

end
