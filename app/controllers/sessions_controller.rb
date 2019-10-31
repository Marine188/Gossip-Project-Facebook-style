class SessionsController < ApplicationController
#
  def new # page de login

  end

  def create
    user = User.find_by(email:params[:email]) # on cherche s'il existe un user en base avec l'email

    if user && user.authenticate(params[:password]) # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
      session[:user_id] = user.id
      redirect_to root_path    # redirige où tu veux, avec un flash ou pas
    else
      flash.now[:danger] = 'Invalid email/password combination' #sinon renvoyer le message d'erreur suivent
      render 'new'
    end
  end

  def destroy
      session.delete(:user_id)#lorsque l'utilisateur logout
      redirect_to root_path
    end
end
