class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles, if_not_exists: true do |t|
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
