class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :header
      t.text :content
      t.timestamps null: false
    end
  end
end
