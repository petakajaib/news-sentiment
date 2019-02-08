json.extract! source, :id, :url, :published_date, :day, :month, :year, :created_at, :updated_at
json.url source_url(source, format: :json)
