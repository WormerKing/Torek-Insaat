class Admin < ApplicationRecord
    # has_secure_password
    devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
end
