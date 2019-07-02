class Post < ApplicationRecord
    mount_uploader :image_name, ImageUploader
    validates :content, {presence: true, length: {maximum: 200}}
    validates :user_id,{presence: true}

    belongs_to :user
end
