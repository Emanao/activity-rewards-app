class User < ApplicationRecord
    has_many :achievements
    has_many :activities, through: :achievements

    validates :name, :password, presence: true, on: :create
    validates :name, uniqueness: true

    has_secure_password

    scope :points_desc_order, -> { order("points DESC") }

    #accepts_nested_attributes_for :activities
        
    def self.find_or_create_onmiauth(auth_hash)
        oauth_name = auth_hash[:info][:name]
        self.where(name: oauth_name).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end

    # Form nested resource: REQ 13 
    def activities_attributes=(activities_attributes)
        activities_attributes_name =  activities_attributes.flatten[1][:name].strip
        activities_attributes_points =  activities_attributes.flatten[1][:points].strip
        if (!activities_attributes_name.blank? && !activities_attributes_points.blank?)
            activity = Activity.find_or_create_by(name: activities_attributes_name, points: activities_attributes_points)
            self.achievements.create(activity: activity) unless self.activities.include?(activity)
        end
    end
end
