class CreateTableFlat < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.string :address
      t.string :longitude
      t.string :latitude
      t.string :bedroom
      t.string :room
      t.string :surface
      t.string :price
      t.string :onesquaremeter
      t.string :tags
      t.string :district
      t.string :neighborhood
      t.timestamps
    end
  end
end
