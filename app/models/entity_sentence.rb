class EntitySentence < ApplicationRecord
  belongs_to :entity
  belongs_to :sentence
end
