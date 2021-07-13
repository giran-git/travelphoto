class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :posts, dependent: :destroy
         has_many :favorites, dependent: :destroy
         
         #ここからフォロー機能関連
  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

  # ユーザーをフォローする
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # ユーザーをアンフォローする
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(user)
    　followings.include?(user)
  end
  #ここまでフォロー機能関連

  validates :name, presence: true, length: {in:1..50}

  attachment :profile_image
end
