module ActiveAdmin::ViewHelpers

  # Conver with imperavi element with given id
  # +target+:: DOM id element
  def wysiwyg(target)
    imperavi target,
      :paths => {
        :stylesheets => ['/assets/imperavi-rails/imperavi/wym.css'],
        :images => {
        # Path to upload handler
        :upload => images_path,
        # Path to list of images
        :list   => images_path(:format => :json)
      }
    }
  end
end 
