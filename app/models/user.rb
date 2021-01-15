class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   validates_uniqueness_of :name, case_sensitive: false
   validates_presence_of :name

   validates_uniqueness_of :email, case_sensitive: false
   validates_presence_of :email

	has_many :posts
	has_many :comments
	has_many :likes
	has_many :followings

  scope :filter_by_starts_with, -> (name) { where("name like ?", "#{name}%")}
  def liked_by_user?
    Following.where(user_id: current_user.id, post_id:
      params[:post_id]).exists?
  end

  def following?(user)
    followings.find_by(follower_id: user.id)
  end

  def feed
    following_ids = "SELECT follower_id FROM followings
                     WHERE  user_id = :user_id"
    Post.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)   
  end

  before_save { self.name.downcase!}

end
