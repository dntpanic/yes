ActiveAdmin.register Image do
  menu :priority => 400, :label => 'Manage Images'
  actions :all, :except => [:edit, :new]

  filter :none

  index do
    column "Images" do |image|
      image_tag(image.image.url, :width => 200)
    end

    default_actions :name=> "Actions"
  end

  show do |img|
    image_tag(img.image.url)
  end
end
