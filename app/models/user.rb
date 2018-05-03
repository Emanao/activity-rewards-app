class User < ApplicationRecord
    has_many :achievements
    has_many :activities, through: :achievements
    validates :name, presence: true
    validates :name, uniqueness: true
    
    has_secure_password
    
    def self.find_or_create_onmiauth(auth_hash)
        oauth_name = auth_hash[:info][:name]
        self.where(name: oauth_name).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end

    def activities_attributes=(activities_attributes)
        activity = Activity.find_or_create_by(name: activities_attributes.flatten[1][:name])
        self.achievements.build(activity: activity) unless self.achievements.include?(activity)
    end
end
