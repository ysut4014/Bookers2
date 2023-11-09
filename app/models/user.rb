class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

 validates :name, presence: true
 
 validates :introduction, presence: true
 
 has_one_attached :avatar
       
         
 has_many :books, dependent: :destroy
 
 validates :name, presence: true

 has_one_attached :image

end
