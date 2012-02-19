ActiveAdmin.register Project do
  actions :all, :except => [:show]
  
  index do
    column "Title", :title
    column "Author", :person
    column "Content" do |project|
      project.content.truncate 500
    end

    default_actions :name=> "Actions"
  end
  
end
