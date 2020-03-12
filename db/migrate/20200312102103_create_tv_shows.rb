class CreateTvShows < ActiveRecord::Migration[5.1]
  def change
    create_table :tv_shows do |t|
      t.string :name
      t.time :timing
      t.integer :channel_id
      t.timestamps
    end
  end
end
