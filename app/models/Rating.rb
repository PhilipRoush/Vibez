class Rating < ApplicationRecord
   belongs_to :user
   belongs_to :song

   validates :rating, presence: true
   validates :song, uniqueness: { scope: :user }
    
end