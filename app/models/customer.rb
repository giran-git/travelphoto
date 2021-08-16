class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts, dependent: :destroy
         #２ついいね機能
         has_many :favorites, dependent: :destroy
         has_many :favorite_posts, through: :favorites, source: :item

         #ここからフォロー機能関連
  # 自分がフォローされる（被フォロー）側の関係性
  has_many :relationships
  #フォローしている customer 達を取得
  has_many :followings, through: :relationships, source: :follow
  #followingsテーブルからフォローしている人のデータをとってくる
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  #customerテーブルから自分をフォローしているcustomerをとってくる
  has_many :followers, through: :reverse_of_relationships, source: :customer

  # ユーザーをフォローする
  def follow(other_customer)
    unless self == other_customer
      self.relationships.find_or_create_by(follow_id: other_customer.id)
    end
  end
  # ユーザーをアンフォローする
  def unfollow(other_customer)
    relationship = self.relationships.find_by(follow_id: other_customer.id)
    relationship.destroy if relationship
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_customer)
    self.followings.include?(other_customer)
  end
  #ここまでフォロー機能関連


  has_many :comments, dependent: :destroy #コメント機能

  validates :name, presence: true, length: {in:1..50}

  attachment :profile_image

# ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end
end
