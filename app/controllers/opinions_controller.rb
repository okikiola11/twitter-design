class OpinionsController < ApplicationController
  before_action :logged_in_user

  def index
    @opinions = Opinion.all
  end

  def new
    @opinion = current_user.opinions.new
  end

  def create
    @opinion = current_user.opinions.create(author_id: current_user.id, Text: Text)
    if @opinion
      flash[:notice] = 'Your opinion has been saved successfully'
      redirect_to root_path
    else
      flash[:danger] = 'Could not save your opinion, Pleas try again!!!'
      render :new
    end
  end
end
