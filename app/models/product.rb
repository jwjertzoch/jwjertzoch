class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :name, presence: true
  validates :description, length: { minimum: 20 }
  # validates :category, presence: true
  validates :image_url, format: {with: /\A\.(png|jpg|jpeg)\Z/i}
  validates :price, numericality: {greater_than_or_equal_to: 0}
  # define scope for fetching products that have images
  scope :products_with_images, -> {where.not(image_url: nil)}
  # merge scope that is defined in comment model 'recent_comments scope'
  scope :review_recent_comments, -> {joins(:comments).merge(Comment.recent_comments)}

  def self.search(search_term)
    Product.where("name LIKE ?", "%#{search_term}%")
  end

  def highest_rating_comment
   comments.rating_desc.first
  end

  def lowest_rating_comment
   comments.order(:rating)
  end

  def average_rating
   comments.average(:rating).to_f
  end
end
