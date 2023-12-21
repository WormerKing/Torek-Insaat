class Admin < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
    validates :username ,uniqueness: {case_sensitive: false}
    validates :password ,length: {minimum:6,maximum:129}, format: {with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}/}, :on => :create

    def self.valid_username?(username)
        if username.blank? || !username.match(/^[A-Za-z\d]*[-_]{0,1}[A-Za-z\d]*[-_]{0,1}[A-Za-z\d]*$/) || username.length < 6
            false
        else
            true
        end
    end
    def self.valid_password?(password)
        password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/) ? true : false
    end
end