json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :length, :year, :description, :country
  json.url movie_url(movie, format: :json)
end
