class SessionsController < ApplicationController
  def new
    @user = User.new
  end

 def create
    if auth_hash = request.env["omniauth.auth"]
        @user = User.find_or_create_onmiauth(auth_hash)
        login(@user)
        redirect_to root_path
    else
        @user = User.find_by(name: params[:user][:name])
        if (!!@user && @user.authenticate(params[:user][:password]))
            login(@user)
            redirect_to user_path(@user)
        else
            render :new
        end
    end
  end
  def logout
    session.delete :user_id
    @current_user = nil
    redirect_to root_path
  end


end
