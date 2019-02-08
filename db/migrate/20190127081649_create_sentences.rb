class CreateSentences < ActiveRecord::Migration[5.2]
  def change
    create_table :sentences do |t|
      t.text :sentence
      t.string :language_code
      t.integer :source_id

      t.timestamps
    end
  end
end
