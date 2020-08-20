class Artist < ApplicationRecord
   has_many :songs
   has_many :genres, through: :songs
   has_many :ratings, through: :songs
   has_many :users, through: :songs

   validates :name, presence: true

   #returns a count of songs by the artist in a specific genre
   def songs_per_genre(genre)
      Song.where(artist: self, genre: genre).count
   end
   
   #sorts songs from highest average rating to lowest (unrated songs aren't included)
   def highest_rated_songs
      self.rated_songs.sort_by do |song| 
         song.average_rating
      end.reverse
   end

   #returns an array of 10 artists sorted from highest average rating to lowest
   def self.top_artists
      sorted = Artist.all.sort_by do |artist| 
         if artist.average_rating == nil 
            0
         else 
            artist.average_rating
            
         end
      
      end.reverse
      until sorted.length <= 10 do
         sorted.pop
      end
      sorted
   end

end