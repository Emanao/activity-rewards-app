class Achievement < ApplicationRecord
    belongs_to :user
    belongs_to :activity
    def update_user_account
        self.frequency += 1
        self.save
        self.user.points += self.activity.points
        self.user.save
    end
end
