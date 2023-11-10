class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

 validates :name, presence: true
 validates :name, length: { minimum: 2, maximum: 20 }
 validates :name, uniqueness: true
 validates :introduction, presence: true
 validates :introduction, length: { maximum: 50 }
 
 has_one_attached :avatar
       
 has_one_attached :profile_image         
 
 has_many :books, dependent: :destroy
 
 validates :body, length: { maximum: 200 }
 validates :body, presence: true
 
 

 def profile_image
    if avatar.attached
     avatar
    else
     'default-profile-image'
    end
 end
end
