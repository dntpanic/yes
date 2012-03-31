ActiveAdmin.register Project do
  actions :all, :except => [:show]
  
  index do
    column "Title", :title
    column "Author", :person
    column "Content" do |project|
      project.content.truncate 500
    end
    column "Thumbnail", :width => 200 do |project|
      image_tag(project.thumbnail.url(:small))
    end

    default_actions :name=> "Actions"
  end
 form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :title
      f.input :person
      f.input :content
      f.input :thumbnail, :hint => f.template.image_tag(f.object.thumbnail.url(:small))
    end
    f.buttons
  end
end
