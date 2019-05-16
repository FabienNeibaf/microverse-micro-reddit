class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :link, presence: true, length: { minimum: 10 }
  validates :user, presence: true
  validates_associated :comments
end
