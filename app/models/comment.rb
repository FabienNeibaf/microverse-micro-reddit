class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { minimum: 10 }

  validates_associated :post, :user
end
