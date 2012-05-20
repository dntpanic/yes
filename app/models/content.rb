class Content < ActiveRecord::Base
  validates_presence_of :identifier
  def self.get_content(identifier)
    return Content.where('contents.identifier = ?', identifier).first.content
  end
end
