class Group < ActiveRecord::Base
  has_many :posts

  belongs_to :owner, foreign_key: :user_id, class_name: 'User'

  validates :title, presence: true


  def editable_by_user?(user)
  	user && user == self.owner
  end
end
