class Store < ApplicationRecord
  has_many :locations, dependent: :destroy
  has_many :wines, through: :locations

  validates :name, presence: true,
                   uniqueness: true
end
