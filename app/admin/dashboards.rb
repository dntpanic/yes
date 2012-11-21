ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Blogs" do
          ul do
            BlogPost.limit(20).collect do |blog|
              li do 
                link_to(blog.title, edit_admin_blog_post_path(blog))
              end
            end
          end
          div do
            link_to('Create new Post', new_admin_blog_post_path())
          end
        end
      end
      column do
        panel "People" do
          ul do
            Person.limit(20).collect do |person|
              li do 
                link_to(person.name, edit_admin_person_path(person))
              end
            end
          end
          div do
            link_to('Create new Person', new_admin_person_path())
          end
        end
      end
      column do
        panel "Projects" do
          ul do
            Project.limit(20).collect do |project|
              li do 
                link_to(project.title, edit_admin_project_path(project))
              end
            end
          end
          div do
            link_to('Create new Project', new_admin_project_path())
          end
        end
      end
    end

  end # content
end
