ActiveAdmin.register Person do
  actions :all, :except => [:show]

  filter :name
  filter :about

  index do
    column "Name", :name
    column "Avatar", :width => 200 do |person|
      image_tag(person.avatar.url(:small))
    end

    column "About" do |person|
      strip_tags(person.about).truncate 500
    end

    column "Projects" do |person|
      @projects = person.projects
      render  "projects_list", :projects => person.projects
    end

    default_actions :name=> "Actions"
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :about, :hint => f.template.wysiwyg(:person_about)
      f.input :twitter_url,
          :input_html => { :size => 64,:style => "width:auto;" },
          :as => :url
      f.input :facebook_url,
          :input_html => { :size => 64,:style => "width:auto;" },
          :as => :url
      f.input :avatar, :hint => f.template.image_tag(f.object.avatar.url(:small))
    end
    f.buttons
  end
end


