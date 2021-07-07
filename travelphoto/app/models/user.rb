class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :posts, dependent: :destroy
         has_many :favorites, dependent: :destroy
         
         #ここからフォロー機能関連
  #active_relationshipsとして、フォローしている側のユーザIDと相手側のユーザIDを配列させる。
  has_many :active_relationships, class_name: "Relationship",
            foreign_key: "follower_id",
            dependent: :destroy
  #passive_relationshipsとして、フォローしてくれている相手側のユーザIDとフォローされたユーザIDを配列させる。
  has_many :passive_relationships, class_name: "Relationship",
            foreign_key: "followed_id",
            dependent: :destroy
  #active_relationshipsテーブルをthroughし、フォローしている相手のIDをfollowedとして取得し、followingとして配列させる。
  has_many :following, through: :active_relationships, source: :followed
  #passive_relationshipsテーブルをthroughし、フォローしてくれている相手のIDをfollowerとして取得し、followersとして配列させる。  
  has_many :followers, through: :passive_relationships, source: :follower
  #followingはフォローしているユーザ一覧、followersはフォロワー一覧を取り出す。

  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
  #ここまでフォロー機能関連

  validates :name, presence: true, length: {in:1..50}

  attachment :profile_image
end
