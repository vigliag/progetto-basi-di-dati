json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :length, :year, :description, :country
  json.url admin_movie_url(movie, format: :json)
end
