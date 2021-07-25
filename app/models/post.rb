class Post < ApplicationRecord
  attachment :image
  belongs_to :customer
  has_many :post_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  has_many :favorites, dependent: :destroy
  has_many :favorite_customers, through: :favorites, source: :customer

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  # プルダウン用
   enum post_area:{
     "---":0,
      川:1,山:2,渓流:3,湖:4,海:5,街中:6,その他:7,
   }


end
