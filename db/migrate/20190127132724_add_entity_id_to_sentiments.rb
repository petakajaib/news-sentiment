class AddEntityIdToSentiments < ActiveRecord::Migration[5.2]
  def change
    add_column :sentiments, :entity_id, :integer
  end
end
