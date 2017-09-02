class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :preview_image
      t.text :description

      t.timestamps null: false
    end
  end
end
