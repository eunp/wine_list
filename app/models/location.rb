class Location < ApplicationRecord
  belongs_to :store
  has_one :wine, dependent: :nullify

  validates :position, presence: true
end
