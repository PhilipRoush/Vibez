class Artist < ApplicationRecord
   has_many :songs
   has_many :genres, through: :songs
    
   def unique_genres
      self.genres.uniq
   end

   def songs_per_genre(genre)
      Song.where(artist: self, genre: genre).count
   end

   def sort_genres
      self.unique_genres.sort_by do |genre| 
         self.songs_per_genre(genre)
      end.reverse
   end
end