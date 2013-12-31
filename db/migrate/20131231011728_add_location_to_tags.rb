class AddLocationToTags < ActiveRecord::Migration
  def change
    add_column :tags, :address, :string
    add_column :tags, :latitude, :float
    add_column :tags, :longitued, :float
  end
end
