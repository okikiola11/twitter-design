class OpinionsController < ApplicationController
  before_action :set_opinion, only: %i[show edit update destroy]
  before_action :logged_in_user
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @opinions = Opinion.all.order('created_at DESC')
    @opinion = Opinion.new
    @users = User.all_users(current_user.id)
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)
    @opinion.author_id = current_user.id

    if @opinion.save
      flash[:notice] = 'Opinion was successfully created'
    else
      flash[:alert] = 'Could not save your opinion, Please try again!!!'
    end
    redirect_to root_path
  end

  def show; end

  def edit
    @opinion = current_user.opinions.find(params[:id])
  end

  def update
    @opinion = current_user.opinions.find(params[:id])
    if @opinion.update(opinion_params)
      redirect_to @opinion, notice: 'Successfully updated'
    else
      render 'edit', alert: 'Something went wrong'
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:Text)
  end

  def set_opinion
    @opinion = Opinion.find([params[:id]])
  end

  def correct_user
    @opinion = Opinion.find(params[:id])

    return if current_user?(@opinion.author)

    flash[:alert] = 'You cannot perform this action'
    redirect_to root_path
  end
end
