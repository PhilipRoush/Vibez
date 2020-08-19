class User < ApplicationRecord
   has_many :ratings
   has_many :songs, through: :ratings
   
   validates :username, uniqueness: true, presence: true
    has_secure_password
end