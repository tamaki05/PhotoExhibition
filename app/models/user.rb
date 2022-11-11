class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :exhibitions, dependent: :destroy
        has_many :favorites, dependent: :destroy
        has_many :comments, dependent: :destroy
        has_many :favorited_exhibitions, through: :favorites, source: :exhibition
        
        # フォロー機能
        has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
        has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
        has_many :followings, through: :relationships, source: :followed
        has_many :followers, through: :reverse_of_relationships, source: :follower
        
        # DM機能
        has_many :entries, dependent: :destroy
        has_many :messages, dependent: :destroy
        
  has_one_attached :profile_image

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  def get_image( width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, width]).processed
  end
  
    # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
  
  # アカウントの公開・非公開設定
  enum status: {nonreleased: 0, released: 1}

end
#