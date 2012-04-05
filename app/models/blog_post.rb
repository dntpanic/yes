class BlogPost < ActiveRecord::Base
  def self.prev(id)
    return BlogPost.where('blog_posts.id < ?', id).last
  end

  def self.next(id)
    return BlogPost.where('blog_posts.id > ?', id).first
  end
end
