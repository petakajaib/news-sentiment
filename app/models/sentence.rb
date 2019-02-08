class Sentence < ApplicationRecord
  belongs_to :source
  has_many :sentiments
  has_many :entity_sentences
  has_many :entities, through: :entity_sentences
end
