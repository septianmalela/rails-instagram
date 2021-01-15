class Following < ApplicationRecord
	belongs_to :user

	# def followed?
 #      follow = Followed.find_by(user_id: self.id)
 #    end 
end
