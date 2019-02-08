class AddSentimentToSentiments < ActiveRecord::Migration[5.2]
  def change
    add_column :sentiments, :sentiment, :integer
  end
end
