class Sentiment < ApplicationRecord
  enum sentiment: [ :positive, :negative ]
  belongs_to :sentence
  belongs_to :source
  belongs_to :entity
end
