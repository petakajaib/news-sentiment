class AddSentenceIdToEntitySentences < ActiveRecord::Migration[5.2]
  def change
    add_column :entity_sentences, :sentence_id, :integer
    remove_column :entity_sentences, :source_id
  end
end
