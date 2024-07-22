class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

       
         #User model has many post
         has_many :posts
         has_many :comments
         has_one_attached :avatar
         has_many :likes
       
  end