class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_attached_file :image, styles: { medium: "300x300#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%").order('created_at DESC')
    else
      all.order('created_at DESC')
    end
  end
end
