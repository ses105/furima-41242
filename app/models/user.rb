class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'must be alphanumeric characters'

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates_format_of :last_name, :first_name, with: NAME_REGEX, message: 'must be entered in full-width characters'

  KANA_REGEX = /\A[ァ-ヶー]+\z/
  validates_format_of :last_name_kana, :first_name_kana, with: KANA_REGEX,
                                                         message: 'must be entered in full-width-katakana characters'


  has_many :items
end
