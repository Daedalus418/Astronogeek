class SessionsController < ApplicationController

  before_action :prevent_logged_in_user_access, except: :destroy
  before_action :prevent_unauthorized_user_access, only: :destroy

  def new
  end

  def create
    user = User.find_by(username: login_params[:username])

    if user && user.authenticate(login_params[:password])
      login(user)
      redirect_to root_path, notice: 'Connecté'
    else
      flash.now[:notice] = 'Nom d\'utilisateur et/ou mot de passe invalide(s).'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Déconnexion'
  end

  private

  def login_params
    params.require(:session).permit(:username, :password)
  end
end
