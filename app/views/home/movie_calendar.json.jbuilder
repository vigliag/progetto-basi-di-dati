json.success 1
json.result @entries do |entry|
	json.extract!(entry, :movie_id, :title)
	json.start entry[:start].to_date.strftime("%Q")
	json.end entry[:end].to_date.strftime("%Q")
	json.url movie_details_path(entry[:movie_id])
	json.id entry[:movie_id]
end