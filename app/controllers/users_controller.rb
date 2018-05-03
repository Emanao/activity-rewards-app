class UsersController < ApplicationController
    before_action :login_required, only: [:show, :update]
    before_action :set_user, only: [:show, :update]
    #signup
    def new
        @user = User.new
    end
    #signup
    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_path(@user)
        else
            render :new
        end
    end
    #show users profile
    def show
        redirect_to logout_path if current_user != @user
    end

    #update users profile
    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    private
    def user_params
        params.require(:user).permit(:name, 
                                     :password, 
                                     :password_confirmation, 
                                     :admin, 
                                     :points, 
                                     :activity_ids => [], 
                                     :activities_attributes=> :name)
    end
    def set_user
        @user = User.find_by(id: params[:id])
    end

end
