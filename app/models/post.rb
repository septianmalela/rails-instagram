class Post < ApplicationRecord
	belongs_to :user
	has_many :attachment_posts
    accepts_nested_attributes_for :attachment_posts
	has_many :likes
	has_many :comments

	default_scope { order(created_at: :desc) }

	# def liked_by_user(user)
	# 	Like.find_by(user: user)&.user_id || User.find_by(id: user)
	# end
	def liked_by_user?
		Like.where(user_id: current_user.id, post_id:
	  	params[:post_id]).exists?
	end

	scope :show_post, -> { where user_id: Following.user_id }

end
