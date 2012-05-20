ActiveAdmin.register BlogPost do
  actions :all, :except => [:show]

  filter :title
  filter :cut
  filter :content

  index do
    column "Title", :title
    column "Cut" do |post|
      strip_tags(post.cut).truncate 200
    end

    column "Content" do |post|
      strip_tags(post.content).truncate 500
    end

    column "Updated" do |post| 
      post.updated_at.strftime('%d %b %Y, %H:%M')
    end
    default_actions :name=> "Actions"
  end

  form do |f|
    f.inputs "Blog Post Details" do
      f.input :title, :required => true

      f.input :cut, :hint => f.template.wysiwyg(:blog_post_cut),
        :required => true

      f.input :content, :hint => f.template.wysiwyg(:blog_post_content),
        :required =>true
    end
    f.buttons
  end
  
end
