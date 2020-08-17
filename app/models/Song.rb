class Song < ApplicationRecord
   belongs_to :artist
   belongs_to :genre
   has_many :ratings
   has_many :users, through: :ratings
    
end