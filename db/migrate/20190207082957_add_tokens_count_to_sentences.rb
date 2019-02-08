class AddTokensCountToSentences < ActiveRecord::Migration[5.2]
  def change
    add_column :sentences, :tokens_count, :integer
  end
end
