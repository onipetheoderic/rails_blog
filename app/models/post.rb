class Post < ApplicationRecord
	has_many :comments, dependent: :destroy #so that when the post is deleted the comment would also be deleted
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true, length: {minimum: 50 }
end
