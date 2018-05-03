class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update]
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_path(@user)
        else
            render :new
        end
    end
    def show

    end
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
