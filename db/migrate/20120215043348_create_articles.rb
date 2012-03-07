class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
     t.string :title
      t.text :body
      t.datetime :published_at
      t.integer :price
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
