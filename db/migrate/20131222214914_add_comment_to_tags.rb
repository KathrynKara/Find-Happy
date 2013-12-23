class AddCommentToTags < ActiveRecord::Migration
  def change
    add_column :tags, :comment, :text
  end
end
