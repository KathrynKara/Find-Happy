class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.belongs_to :user, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
