class AchievementsController < ApplicationController
    before_action :login_required
    # Shows user goals (/users/:id/achievements)
    # Requirement 12: nested resource index 
    def index
        if(params[:user_id])
            @user = User.find_by(id: params[:user_id])
            authentication_required(@user)
            @achievements = @user.achievements
        end
    end
    # Update Achievements frequency and Users total points > 
    # Requirement 6: update of a user submittable attribute in Achievement (join table)
    def update
        achievement = Achievement.find_by(id: params[:id])
        authentication_required(achievement.user)
        achievement.update_user_account
        redirect_to user_achievements_path(achievement.user)
    end

    private
    def achievement_params
        params.require(:achievement).permit(:user_id, :activity_id, :frequency)
    end
end
