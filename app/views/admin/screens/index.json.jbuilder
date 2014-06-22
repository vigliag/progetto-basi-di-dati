json.array!(@admin_screens) do |admin_screen|
  json.extract! admin_screen, :id, :avaiable, :seats_string
  json.url admin_screen_url(admin_screen, format: :json)
end
