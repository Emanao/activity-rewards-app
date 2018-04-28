class SessionsController < ApplicationController
    before_action :set_user, only: [:create]
  def new
    @user = User.new
  end

  def create
    if(@user && @user.authenticate(params[:user][:password]))
        session[:user_id] = @user.user_id
        redirect_to users_path
    else
        render :new
    end
  end
  private
  def set_user
    @user = User.find_by(params[:user][:name])
  end
end
