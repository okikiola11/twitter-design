class OpinionsController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user

  def index
    @opinions = Opinion.all.order('created_at DESC')
    @opinion = Opinion.new
    @users = User.all_users(current_user.id)
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.create(opinion_params)
    @opinion.author_id = current_user.id
    
    if @opinion.save
      flash[:notice] = 'Opinion was successfully created'  
    else
      flash[:danger] = 'Could not save your opinion, Pleas try again!!!'
    end
    redirect_to root_path
  end 

  def show
  end

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

  def destroy
    @opinion = current_user.opinions.find(params[:id])
    if @opinion.destroy
      flash[notice] = 'Opinion has been deleted successfully'
    else
      flash[:danger] = 'Please, try again!!!'
    end
    redirect_to root_path
  end

  private

  def opinion_params
    params.require(:opinion).permit(:Text)
  end

  def set_opinion
    @opinion = Opinion.find([params[:id]])
  end
end
