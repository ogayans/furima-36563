class Item < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :day
  belongs_to :load
  belongs_to :prefecture

  validates :title, :text, :price, :image, presence: true
  validates :price, numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300 },
   format: { with: /\A[0-9]+\z/ }
  validates :category_id, :condition_id, :day_id, :load_id, :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
end
