class ActivitiesController < ApplicationController
    before_action :login_required
    before_action :set_activity, only: [:show, :edit, :update]
     def index
        if(params[:user_id])          
            @user = User.find_by(id: params[:user_id])
            authentication_required(@user)
        else
            @activities = Activity.all
        end
    end
    def show
    end

    def new
       @activity = Activity.new
       @activities = Activity.all
    end
    def create

        @activity = Activity.new(activity_params)
        @activities = Activity.all
        if @activity.save
            render new_activity_path
        else
            render :new
        end
    end
    def edit
    end
    def update
        raise params.inspect
        @activity.update(activity_params)
        redirect_to new_activity_path 
    end
    private
    def activity_params
        params.require(:activity).permit(:name, :points)
    end
    def set_activity
        @activity = Activity.find_by(id: params[:id])
    end
end
