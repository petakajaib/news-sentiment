class AddSourceIdToSentiments < ActiveRecord::Migration[5.2]
  def change
    add_column :sentiments, :source_id, :integer
  end
end
