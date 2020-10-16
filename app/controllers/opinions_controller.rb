class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  def index
    @opinions = Opinion.all.order('created_at DESC')
    @opinion = Opinion.new
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.create(opinion_params)
    if @opinion.save
      flash[:notice] = 'Your opinion has been saved successfully'  
    else
      flash[:danger] = 'Could not save your opinion, Pleas try again!!!'
    end
    redirect_to root_path
  end 

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def opinion_params
    params.require(:opinion).permit(:author_id, :Text)
  end

  def set_opinion
    @opinion = Opinion.find([params[:id]])
  end
end
