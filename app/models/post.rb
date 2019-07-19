class Post < ApplicationRecord
    mount_uploader :image_name, ImageUploader
    validates :content, {presence: true, length: {maximum: 200}}
    validates :user_id,{presence: true}

    belongs_to :user
    has_many :favorites
    has_many :comments

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
end
