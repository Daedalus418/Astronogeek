class CommentsController < ApplicationController

  before_action :prevent_unauthorized_user_access
  before_action :set_variables, only: [:edit, :update, :destroy]

  def create
    @idea = Idea.find_by(id: params[:idea_id])
    @comment = @idea.comments.new(user: current_user, body: comment_params[:body])

    if @comment.save
      redirect_to @idea, notice: 'Commentaire ajouté.'
    else
      redirect_to @idea, notice: 'Le commentaire n\'a pas été sauvegardé. Assurez-vous d\'avoir écrit un commentaire.'
    end
  end

  def edit
    unless current_user.owns_comment?(@comment)
      redirect_to root_path, notice: 'Vous n\'êtes pas autorisé à modifier ce commentaire.' 
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @idea, notice: 'Commentaire modifié.'
    else
      render :edit
    end
  end

  def destroy
    if current_user.owns_comment?(@comment)
      @comment.destroy
      redirect_to @idea, notice: 'Commentaire supprimé.'
    else
      redirect_to @idea, notice: 'Vous n\'êtes pas autorisé à supprimer ce commentaire.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_variables
    @idea = Idea.find_by(id: params[:idea_id])
    @comment = @idea.comments.find_by(id: params[:id])
  end
end
