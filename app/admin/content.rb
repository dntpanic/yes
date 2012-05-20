ActiveAdmin.register Content do
  # standard 
  #actions :all, :except => [:show]
  
  #Custom actions to avoid headache
  actions :index, :new, :create, :update, :edit

  filter :identifier
  filter :content

  index do
    column :identifier
    column :content
    default_actions :name=> "Actions"
  end

  form  do |f|
    f.inputs "Content block details" do
      if !f.object.new_record?
        f.input :identifier, :input_html => { :disabled => true },
          :hint => 'In order to keep in safe whole site you can\'t modify this field.'
      else
        f.input :identifier
      end
      f.input :content, :hint => f.template.wysiwyg(:content_content)
    end
    f.buttons
  end

end
