class User < ApplicationRecord
  
  has_many :posts
  has_many :comments

  validates :login, presence: true,
                    length: { minimum: 6 },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :name, presence: true
end
