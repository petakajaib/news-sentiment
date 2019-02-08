class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :url
      t.datetime :published_date
      t.integer :day
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
