class User < ApplicationRecord
    has_secure_password
    has_many :favorites, dependent: :destroy
    has_many :movies, through: :favorites
    validates :username, presence: true
    validates :email, presence: true, uniqueness: {case_sensitive: false}
end
