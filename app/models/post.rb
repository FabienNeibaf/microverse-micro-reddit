class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true
  validates :user, presence: true
  validates_associated :comments
end
