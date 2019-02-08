class Entity < ApplicationRecord
  has_many :entity_sentences
  has_many :entity_sources
  has_many :sentiments
  has_many :sentences, through: :entity_sentences
  has_many :sources, through: :entity_sources
end
