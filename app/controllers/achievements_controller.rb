class AchievementsController < ApplicationController
    def index
        if(params[:user_id])
            @user = User.find_by(id: params[:user_id])
            @achievements = @user.achievements
        else
            redirect_to root_path
        end
    end
    def create
        Achievement.create(achievement_params)
        redirect_to user_path(current_user)
        
    end
    def update
        raise params.inspect
    end

    private
    def achievement_params
        params.require(:achievement).permit(:user_id, :activity_id)
    end
end
