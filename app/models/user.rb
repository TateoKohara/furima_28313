class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :customers 

  with_options presence: true, format: { with: /@./ , message: '@を含めてください' } do
    validates :email
  end

  with_options presence: true, format: { with: /[a-z\d]{6,}/i , message: '6文字以上で入力してください' } do
    validates :password
    validates :password_confirmation
  end
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :family_name
    validates :first_name
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください' } do
    validates :family_name_j
    validates :first_name_j
  end

  validates :nickname, :birth, presence: true
  validates :email, uniqueness: true


end
