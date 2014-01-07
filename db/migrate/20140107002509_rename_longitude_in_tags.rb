class RenameLongitudeInTags < ActiveRecord::Migration
  def change
    rename_column :tags, :longitued, :longitude
  end
end
