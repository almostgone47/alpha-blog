class Category < ApplicationRecord
  validates :category_name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 24 }
  has_many :article_categories
  has_many :articles, through: :article_categories
end
