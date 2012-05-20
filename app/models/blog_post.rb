class BlogPost < ActiveRecord::Base
  validates_presence_of :title, :cut, :content
  def self.prev(id)
    return BlogPost.where('blog_posts.id < ?', id).last
  end

  def self.next(id)
    return BlogPost.where('blog_posts.id > ?', id).first
  end
  default_scope order 'created_at desc'
end
