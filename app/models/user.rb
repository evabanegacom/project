class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  validate :image_type

  private
  def image_type
    if image.attached? == false
      errors.add(:image, 'is missing')
    end
    if image.attached? == true
     if !image.content_type.in?(%('images/jpg image/jpeg image/png'))
       errors.add(:image, 'needs to be ajpeg or png')
     end
    end
  end
end
