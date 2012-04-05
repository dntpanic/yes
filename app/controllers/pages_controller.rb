class PagesController < ApplicationController
  def index
  end
  def about
  end
  def blog
    @blogs = BlogPost.all
  end
  def blog_inside
    id = params[:id].to_i
    @blog = BlogPost.find(id)
    @blogPrev = BlogPost.where('blog_posts.id < ?', id).last
    @blogNext = BlogPost.where('blog_posts.id > ?', id).first
    @projects = Project.all.shuffle[0..4]
  end
  def contact_us
  end
  def inside_project
  end
  def people
    @people = Person.all
    @projects = Project.all.shuffle[0..10]
  end
  def profile
  end
end
