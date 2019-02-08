class CreateSentiments < ActiveRecord::Migration[5.2]
  def change
    create_table :sentiments do |t|
      t.float :positive
      t.float :negative
      t.integer :sentence_id
      t.timestamps
    end
  end
end
