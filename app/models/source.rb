class Source < ApplicationRecord
  has_many :sentences
  has_many :sentiments
  has_many :entity_sources
  has_many :entities, through: :entity_sources
end
