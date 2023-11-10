class Book < ApplicationRecord
  has_one_attached :image  
  belongs_to :user
  paginates_per 10
  validates :body, presence: true, length: { maximum: 200 }
  validates :title, presence: true 
  validates :body, presence: true
  
  def get_image
    if image.attached?
      image
    else
      'default-image'
    end 
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      image
    end
  end
end
