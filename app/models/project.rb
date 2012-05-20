class Project < ActiveRecord::Base
  has_attached_file :thumbnail,
    :styles => { :small => "150x150>" },
    :url  => "/assets/projects/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/projects/:id/:style/:basename.:extension"

  validates_presence_of :title,:person, :content
  validates_attachment_presence :thumbnail
  
  def self.works(person_id, project_id)
    return Project.where('projects.person_id = ? and projects.id != ?', person_id, project_id).limit(5)
  end

  belongs_to :person
end

