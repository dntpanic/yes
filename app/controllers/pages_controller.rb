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
    @blogPrev = BlogPost.prev(id)
    @blogNext = BlogPost.next(id)
    @projects = Project.all.shuffle[0..4]
  end
  def contact_us
  end
  def inside_project
    @project = Project.find(params[:id])
    @person = Person.find(@project.person_id)
    @works = Project.works(@project.person_id, @project.id)
  end
  def people
    @people = Person.all
    @projects = Project.all.shuffle[0..10]
  end
  def profile
    @person = Person.find(params[:id])
    @works = Project.works(@person.id, 0).shuffle[0..4]
    @people = Person.all.shuffle[0..6]
  end
end
