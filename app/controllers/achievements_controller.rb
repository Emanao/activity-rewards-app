class AchievementsController < ApplicationController
    def index
        if(params[:user_id])
            @user = User.find_by(id: params[:user_id])
            @achievements = @user.achievements
        else
        end
    end
    def update
        raise params.inspect
    end

    private
    def achievement_params
        params.require(:user).permit(:activity_ids)
    end
    def user_params
        params.require(:user_id)
    end
end
