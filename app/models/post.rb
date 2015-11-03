class Post < ActiveRecord::Base
  belongs_to :group
  belongs_to :author, foreign_key: :user_id, class_name: 'User'

  validates :content, presence: true
end
