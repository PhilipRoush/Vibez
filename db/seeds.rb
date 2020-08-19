#artists

10.times do
    Artist.create(name: Faker::Music.band)
end

10.times do
    Genre.create(name: Faker::Music.genre)
end

30.times do
    Song.create(title: Faker::Music.album, artist_id: rand(1..10), genre_id: rand(1..10), release_date: Faker::Date.backward, link: Faker::Internet.url)
end

10.times do
    User.create(username: Faker::Internet.username, password: Faker::Internet.password)
end

50.times do
    Rating.create(song_id: rand(1..30), user_id: rand(1..10), rating: rand(1..5))
end