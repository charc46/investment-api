class SessionsController < ApplicationController
  def create 
    user = User.find_by(email: params[:user][:email])
    if user&.authenticate(params[:user][:password])
      session[:user_id] = user.id
      render json: {
        logged_in: true,
        user: user
      }
    else
      render json: {
        logged_in: false,
        error: 'Invalid email/password combination'
      }
    end
  end

  def logout
    session.clear 
    render json: { logged_in: false }
  end 

  def logged_in
    if @current_user
      render json: { 
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end
end