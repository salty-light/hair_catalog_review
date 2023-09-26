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
end
