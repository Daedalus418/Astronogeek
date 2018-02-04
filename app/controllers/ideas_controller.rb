class IdeasController < ApplicationController

  before_action :prevent_unauthorized_user_access, only: [:new]
  before_action :prevent_unauthorized_user_access, except: [:show, :index]
  before_action :find_idea, only: [:show, :upvote]

  def index
    @ideas = Idea.hottest
  end

  def newest
    @ideas = Idea.newest
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(event_params)
    
    if @idea.save
      redirect_to root_path, notice: 'Nouvelle idée créée.'
    else
      render :new
    end
  end

  def show
    @comments = @idea.comments
  end

  def upvote
    if current_user.upvoted?(@idea)
      current_user.remove_vote(@idea)
    else
      current_user.upvote(@idea)
    end
    @idea.calc_hot_score
    redirect_to root_path
  end

  private

  def find_idea
    @idea = Idea.find(params[:id])
  end

  def event_params
    params.require(:idea).permit(:title, :description)
  end
end
