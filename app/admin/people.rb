ActiveAdmin.register Person do
  actions :all, :except => [:show]

  index do
    column "Name", :name
    #column "Twitter", :twitter_url
    #column "Facebook", :facebook_url
    column "Name", :name
    column "Avatar", :width => 200 do |person|
      image_tag(person.avatar.url(:small))
    end

    column "About" do |person|
      person.about.truncate 500
    end

    column "Projects" do |person|
      @projects = person.projects
      render  "projects_list", :projects => person.projects
    end

    default_actions :name=> "Actions"
  end

  form :partial => "form"
end
