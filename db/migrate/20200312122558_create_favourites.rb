class CreateFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :favourites do |t|
      t.integer :user_id
      t.integer :tv_show_id
      t.boolean :is_favourite, default: false
      t.timestamps
    end
  end
end
