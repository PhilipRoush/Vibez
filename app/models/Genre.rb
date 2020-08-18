class Genre < ApplicationRecord
   has_many :songs
   has_many :artists, through: :songs

   def unique_artists
      self.artists.uniq
   end
    
   def songs_per_artist(artist)
      Song.where(genre: self, artist: artist).count
   end

   def sort_artists
      self.unique_artists.sort_by do |artists| 
         self.songs_per_artist(artists)
      end.reverse
   end
end