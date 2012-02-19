class Person < ActiveRecord::Base
  has_attached_file :avatar, 
    :styles => { :small => "150x150>" },
    :url  => "/assets/people/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/people/:id/:style/:basename.:extension"

  validates_attachment_presence :avatar

  has_many :projects
end
