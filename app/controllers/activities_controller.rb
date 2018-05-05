class ActivitiesController < ApplicationController
    before_action :login_required
    before_action :set_activity, only: [:show, :edit, :update]
     def index
        authentication_required(@user)
        @user = User.find_by(id: params[:user_id])
        @activities= Activity.all
    end
    def show
    end
    def edit
    end
    def update
        @activity.update(activity_params)
        redirect_to activities_path 
    end
    private
    def activity_params
        params.require(:activity).permit(:name, :points)
    end
    def set_activity
        @activity = Activity.find_by(id: params[:id])
    end
end
