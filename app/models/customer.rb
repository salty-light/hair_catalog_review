class Customer < ApplicationRecord
  has_many :favorites, dependent: :destroy
  def self.looks(search, word)
    if search == "perfect_match"
      @customer = Customer.where("nick_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @customer = Customer.where("nick_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @customer = Customer.where("nick_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @customer = Customer.where("nick_name LIKE?","%#{word}%")
    else
      @customer = Customer.all
    end
  end
  def active_for_authentication?
    super && (is_deleted == false)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "xxxxxxxxx"
      customer.first_name = "xxxxxxxxx"
      customer.last_name_kana = "xxxxxxxxx"
      customer.first_name_kana = "xxxxxxxxx"
      customer.nick_name = "xxxxxxxxx"
    end
  end
end
