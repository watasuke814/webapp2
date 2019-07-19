class User < ApplicationRecord
    mount_uploader :image_name, ImageUploader
    validates :name, {presence: true}
    validates :email,{presence: true, uniqueness: true}
    validates :password,{presence: true}

    has_many :posts
    has_many :favorites
    has_many :comments
    has_many :favorite_posts, through: :favorites, source: :post
end
