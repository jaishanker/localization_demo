class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.string :slug, null: false
      t.timestamps
    end
    add_index :articles, :slug, unique: true

    Article.create_translation_table! :title => :string, :body => :text
  end

  def down
    drop_table :articles
    Article.drop_translation_table!
  end
end
