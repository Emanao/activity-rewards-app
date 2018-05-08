class UsersController < ApplicationController
    before_action :login_required, only: [:show, :update]
    before_action :set_user, only: [:show, :update]

    def index
        @users = User.all
    end

    #signup
    def new
        @user = User.new
    end
    #signup
    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to current_user.admin ? current_user : user_achievements_path(current_user)
        else
            render :new
        end
    end
    
    #show users profile
    def show
        authentication_required(@user)  
        #REQ7: Class level AR scope method 
        if( params[:name_q].present? )
            @users = User.search_name(params[:name_q])
        else
            @users = User.by_desc_points
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        authentication_required(@user)
        @activities = Activity.all
    end

    #update users profile
    def update
        @user.update(user_params)
        redirect_to edit_user_path(@user)
    end

    private
    def user_params
        params.require(:user).permit(:name, 
                                     :password, 
                                     :password_confirmation, 
                                     :admin, 
                                     :points, 
                                     :activity_ids => [], 
                                     :activities_attributes=> [:name, :points])
    end
    def set_user
        @user = User.find_by(id: params[:id])
    end

end
