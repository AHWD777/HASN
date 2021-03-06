class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 200}
  default_scope -> { order(created_at: :desc) }
  acts_as_votable
end
