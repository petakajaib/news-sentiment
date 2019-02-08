class RemoveColumnFromSentence < ActiveRecord::Migration[5.2]
  def change
    remove_column :sentences, :sentence
    add_column :sentences, :sentence, :string
  end
end
