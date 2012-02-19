class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :cut
      t.text :content

      t.timestamps
    end
  end
end
