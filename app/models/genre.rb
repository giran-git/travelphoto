class Genre < ApplicationRecord
  has_many :items
  # ジャンルの名前の空白登録の制限
  validates :name, presence: true
end
