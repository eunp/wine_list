class Wine < ApplicationRecord
  belongs_to :location, optional: true
  has_one :store, through: :location

  validates :name, :vineyard, presence: true
  validates :year, presence: true, 
                   length: { is: 4 },
                   numericality: { only_integer: true }
  validates :price, numericality: true

  before_validation :ensure_vineyard_is_not_blank

  protected
    def ensure_vineyard_is_not_blank
      if vineyard.blank?
        self.vineyard = name unless name.blank?
      end
    end
end
