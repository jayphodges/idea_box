class Idea < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :idea_images
  has_many :images, through: :idea_images, dependent: :destroy
  belongs_to :category

end
