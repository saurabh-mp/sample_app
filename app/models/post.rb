class Post < ApplicationRecord
  attr_accessor :tags

  after_save :set_tags

  def set_tags
    REDIS.set(self.id, self.tags)
  end
end
