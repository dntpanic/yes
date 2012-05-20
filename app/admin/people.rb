ActiveAdmin.register Person do
  actions :all, :except => [:show]

  index do
    column "Name", :name
    #column "Twitter", :twitter_url
    #column "Facebook", :facebook_url
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

  #form :html => { :enctype => "multipart/form-data" } do |f|
    #f.inputs "Details" do
      #f.input :name
      #f.input :about
      #f.input :avatar, :hint => f.template.image_tag(f.object.avatar.url(:small))
    #end
    #f.buttons
  #end 
  form :partial => "form"
end
