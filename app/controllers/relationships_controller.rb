class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    following = current_user.relationships.build(followed_id: params[:user_id])
    following.save
    redirect_to request.referer
  end

  def destroy
    following = current_user.relationships.find_by(followed_id: params[:user_id])
    following.destroy
    redirect_to request.referer
  end

end
