class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :image
      t.integer :position
      t.string :artist_uri

      t.timestamps null: false
    end
  end
end
