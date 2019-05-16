class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { minimum: 10 }

  validates :post, :user, presence: true

  validate_associated :user, :post
end
