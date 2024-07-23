class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # 
  #
  #
  def self.ransackable_attributes(auth_object = nil)
       ["bio", "created_at", "email", "id", "remember_created_at", "updated_at", "username"]
     end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

       
         #User model has many post
         has_many :posts
         has_many :comments
         has_one_attached :avatar
         has_many :likes
       


         enum role: [:user, :admin]
         after_initialize :set_default_role, :if => :new_record?
         def set_default_role
           self.role ||= :admin
         end
  end