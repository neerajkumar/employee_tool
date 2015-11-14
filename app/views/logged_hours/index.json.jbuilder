json.array!(@logged_hours) do |logged_hour|
  json.extract! logged_hour, :id
  json.url logged_hour_url(logged_hour, format: :json)
end
