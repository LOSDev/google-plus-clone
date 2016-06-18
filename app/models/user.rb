class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, length: {minimum: 1, maximum: 40}, uniqueness: true
  validates :first_name, length: {maximum: 40}
  validates :last_name, length: {maximum: 40}
  validates :tagline, length: {maximum: 140}

  has_many :posts, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

end
