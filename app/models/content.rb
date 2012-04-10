class Content < ActiveRecord::Base
  def self.get_content(identifier)
    return Content.where('contents.identifier = ?', identifier).first.content
  end
end
