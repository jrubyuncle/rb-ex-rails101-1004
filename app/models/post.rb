class Post < ActiveRecord::Base
  belongs_to :group, counter_cache: :posts_count
  belongs_to :author, foreign_key: :user_id, class_name: 'User'

  validates :content, presence: true
end
