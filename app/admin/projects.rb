ActiveAdmin.register Project do
  actions :all, :except => [:show]

  filter :person
  filter :title
  filter :content
  
  index do
    column "Title", :title
    column "Author", :person
    column "Content" do |project|
      strip_tags(project.content).truncate 500
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
      f.input :content,:hint => f.template.wysiwyg(:project_content) 
      f.input :thumbnail, :label => 'Logo', :hint => f.template.image_tag(f.object.thumbnail.url(:small))
    end
    f.buttons
  end
end
