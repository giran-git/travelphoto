class Post < ApplicationRecord
  belongs_to :users
  attachment :image
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # プルダウン用
   enum post_area:{
     "---":0,
      川:1,山:2,渓流:3,湖:4,海:5,町中:6,その他:7,
   }


end
