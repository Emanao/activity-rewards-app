class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:edit, :update]
    def new
       @activity = Activity.new
       @activities = Activity.all
    end
    def create
        @activity = Activity.new(activity_params)
        if @activity.save
            render new_activity_path
        else
            redirect_to new_activity_path, alert: "Activity couldnt be save. Please try again or contact the admin"
        end
    end
    def edit
    end
    def update
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
