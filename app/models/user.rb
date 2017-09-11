class User < ApplicationRecord
  has_many :ideas
  has_secure_password

  validates :name, :email, presence: true,
                         uniqueness: true

  enum role: [:default, :admin]

end
