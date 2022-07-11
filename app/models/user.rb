class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  validates :username, presence: true, uniqueness: true

  after_destroy :destroy_posts

  private

  def destroy_posts
    posts.destroy_all
  end
end