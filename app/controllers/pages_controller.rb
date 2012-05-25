#encoding: utf-8
class PagesController < ApplicationController
  def index
    @index_header = Content.get_content('index_header')
    @last = [Project.order("created_at").limit(100).all + BlogPost.order("created_at").limit(100).all]
  end
  def about
    @about_header = Content.get_content('about_header')
    @about_content = Content.get_content('about_content')
  end
  def blog
    @blogs = BlogPost.all
    @blog_header = Content.get_content('blog_header')
  end
  def blog_inside
    id = params[:id].to_i
    @blog = BlogPost.find(id)
    @blogPrev = BlogPost.prev(id)
    @blogNext = BlogPost.next(id)
    @projects = Project.all.shuffle[0..4]
  end
  def contact_us
    @contact_content = Content.get_content('contact_content')
  end
  def inside_project
    @project = Project.find(params[:id])
    @person = Person.find(@project.person_id)
    @works = Project.works(@project.person_id, @project.id)
  end
  def people
    @people = Person.all
    @projects = Project.all.shuffle[0..10]
    @people_header = Content.get_content('people_header')
  end
  def profile
    @person = Person.find(params[:id])
    @works = Project.works(@person.id, 0).shuffle[0..4]
    @people = Person.all.shuffle[0..6]
  end
  def send_email
    require "mail"
    first_name = params[:first_name]
    last_name = params[:last_name]
    message = params[:body]
    mail = Mail.new do
      from     'yes_contact@mail.com'
      to       'whoisjoy@gmail.com'
      subject  'Сообщение от ' + first_name + '  ' + last_name
      body     message
    end
    mail.delivery_method :sendmail
    mail.deliver
    flash[:notice] = "Сообщение отправлено. Спасибо!"
    redirect_to :back
  end
end
