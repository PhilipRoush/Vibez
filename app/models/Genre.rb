class Genre < ApplicationRecord
   has_many :songs
   has_many :artists, through: :songs
   has_many :users, through: :songs

   validates :name, presence: true

   #returns a count of how many songs a specific artist has in this genre 
   def songs_per_artist(artist)
      Song.where(genre: self, artist: artist).count
   end

   #sorts artists from most songs in this genre to least
   def sort_artists
      self.unique_artists.sort_by do |artist| 
         self.songs_per_artist(artist)
      end.reverse
   end
end