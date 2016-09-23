class CallbacksController < ApplicationController

  def twitter
    user = User.find_or_create_from_twitter request.env['omniauth.auth']
    session[:user_id] = user.id
    redirect_to root_path
  # render json: request.env['omniauth.auth']

  end

    def facebook
      user= User.find_or_create_from_facebook request.env['omniauth.auth']

      session[:user_id] = user.id
      # render json: request.env['omniauth.auth']
      redirect_to root_path
    end
end
