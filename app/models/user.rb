class User < ApplicationRecord
    has_many :achievements
    has_many :activities, through: :achievements

    validates :name, :password, presence: true, on: :create
    validates :name, uniqueness: true
    
    #accepts_nested_attributes_for :activities

    
    has_secure_password
    
    def self.find_or_create_onmiauth(auth_hash)
        oauth_name = auth_hash[:info][:name]
        self.where(name: oauth_name).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end

    def activities_attributes=(activities_attributes)
        activities_attributes_name =  activities_attributes.flatten[1][:name].strip
        if(!activities_attributes_name.blank?)
            activity = Activity.find_or_create_by(name: activities_attributes_name)
            self.achievements.create(activity: activity) unless self.achievements.include?(activity)
        end
    end
end
