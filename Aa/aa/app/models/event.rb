class Event < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations, source: :user
  has_many :reviews, dependent: :destroy
    # Validaciones
  validates :sport, :date, :time, :location, :spots, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[sport date time location spots created_at updated_at]
  end

  
end
