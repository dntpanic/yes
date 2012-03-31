class PagesController < ApplicationController
  def index
  end
  def about
  end
  def blog
  end
  def blog_inside
  end
  def contact_us
  end
  def inside_project
  end
  def people
    @people = Person.all
  end
  def profile
  end
end
