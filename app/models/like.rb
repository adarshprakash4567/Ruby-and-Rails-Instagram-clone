class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #no user can like a post twice,here check the user id has to be unique for the given post id.
  validates :user_id, uniqueness: { scope: :post_id}
end
