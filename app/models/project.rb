class Project < ActiveRecord::Base
  has_attached_file :thumbnail,
    :styles => { :small => "150x150>" },
    :url  => "/assets/projects/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/projects/:id/:style/:basename.:extension"

  validates_attachment_presence :thumbnail

  belongs_to :person
end
