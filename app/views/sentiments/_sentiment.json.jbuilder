json.extract! sentiment, :id, :entity_id, :source_id, :sentence_id, :positive, :negative, :created_at, :updated_at
json.url sentiment_url(sentiment, format: :json)
