class IdeaImage < ActiveRecord::Base
  belongs_to :idea
  belongs_to :image
end
