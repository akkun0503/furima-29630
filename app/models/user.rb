class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers" }
  validates :nickname, presence: true
  validates :birth_date, presence: true
  validates :last_name, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters" }
  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters" }
  validates :last_name_kana, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }
  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" }

end
