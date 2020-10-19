class LikesController < ApplicationController
  before_action :find_opinion

  def create
    @opinion.likes.create(user_id: current_user.id)
    redirect_to opinion_path(@opinion)
  end

  private

  def find_opinion
    @opinion = Opinion.find(params[:opinion_id])
  end
end
