class Achievement < ApplicationRecord
    belongs_to :user
    belongs_to :activity

    #scope :users_with_most_goals, ->{group(:user_id).count}

    def update_user_account
        self.frequency += 1
        self.save
        self.user.points += self.activity.points
        self.user.save
    end
end
