class Book < ApplicationRecord
  belongs_to :category

  belongs_to :author

  belongs_to :publisher

  validates :title, :isbn, presence: true

  validates :title, length: { minimum: 5 }

  # Mount paperclip image
  has_attached_file :image

  #This validates the type of file uploaded. According to this, only images are allowed.
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment :image, presence: true
end
