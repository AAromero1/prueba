class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :participating_events, through: :participations, source: :event
  has_many :events, through: :participations    
  has_one_attached :profile_picture 
  has_many :messages, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def self.ransackable_attributes(_auth_object = nil)
    %w[email created_at updated_at admin]
  end

  def admin?
    self.admin
  end
end
