class User < ApplicationRecord
    has_many :achievements
    has_many :activities, through: :achievements
    has_secure_password
    
    def self.find_or_create_onmiauth(auth_hash)
        oauth_name = auth_hash[:info][:name]
        self.where(name: oauth_name).first_or_create do |user|
            user.password = SecureRandom.hex
        end
    end

    def balance
        "50"
    end
end
