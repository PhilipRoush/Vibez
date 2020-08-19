class User < ApplicationRecord
   has_many :ratings
   has_many :songs, through: :ratings
   has_many :artists, through: :songs
   has_many :genres, through: :songs
   
   validates :username, uniqueness: true, presence: true
    has_secure_password

    #returns a unique array of artists whose songs the user has liked
    def unique_artists
        self.artists.uniq
    end

    #returns a unique array of genres the user has liked songs from
    def unique_genres
        self.genres.uniq
    end

    #returns a rating object for this specific user and a specific song
    def song_rating(song)
        Rating.find_by(user: self, song: song)
    end

    #returns an integer of how many songs the user has liked from a specific genre
    def songs_per_genre(genre)
        song_count = 0
        self.songs.each do |song|
            if song.genre == genre
                song_count += 1
            end
        end
        song_count
    end

    #sorts genres from most songs liked by this user to least
    def sort_genres
        self.unique_genres.sort_by do |genre| 
           self.songs_per_genre(genre)
        end.reverse
    end

    #sorts artists from highest average rating by user to lowest
    def sort_artists
        self.unique_artists.sort_by do |artist| 
            self.artist_rating(artist)
        end.reverse
    end

    #sorts songs from highest rating by user to lowest
    def sort_songs
        self.songs.sort_by do |song|
            self.song_rating(song).rating
        end.reverse
    end

    #returns a float of a user's average rating for all of a specific artist's songs
    def artist_rating(artist)
        user_ratings = artist.songs.map do |song|
            song_rating(song)
        end
        user_ratings.delete(nil)
        ratings_sum = 0
        user_ratings.each do |rating|
            ratings_sum += rating.rating
        end
        avg = ratings_sum.to_f/user_ratings.count.to_f
        avg.round(2)
    end
end