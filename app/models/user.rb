class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  # 「remember_token」という仮想の属性を作成する。
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :department, length: { in: 2..30 }, allow_blank: true
  validates :basic_time, presence: true
  validates :work_time, presence: true
  validates :work_place_of_user, presence: true
  has_secure_password
  validates :password, length: { maximum: 10 }, allow_nil: true
  
  validate :work_time_than_basic_time
  
  def work_time_than_basic_time
      errors.add(:basic_time, "より多い指定勤務時間は無効です") if work_time > basic_time
  end
   # 渡された文字列のハッシュ値を返す。
  def User.digest(string)
    cost = 
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create(string, cost: cost)
  end
  
  # ランダムなトークンを返す。
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
   # 永続セッションのためハッシュ化したトークンをデータベースに記憶する。
   def remember
     # ランダムな文字列をremember_tokenに代入
     self.remember_token = User.new_token
     # remember_token(仮想カラム)　→　remember_digest(DB)
     update_attribute(:remember_token, User.digest(remember_token))
   end
   
  # 永続的セッションに保存しているremember_tokenがDBのremember_digestと一致しているか
  def authenticated?(remember_token)
    # ダイジェストが存在しない場合はfalseを返して終了する。
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  # ユーザーのログイン情報を破棄する。
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def self.search(search) 
    if search
      where(['name LIKE ?', "%#{search}%"]) 
    else
      all 
    end
  end
  
  
end
