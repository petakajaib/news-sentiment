class CreateEntitySentences < ActiveRecord::Migration[5.2]
  def change
    create_table :entity_sentences do |t|
      t.integer :entity_id
      t.integer :source_id

      t.timestamps
    end
  end
end
