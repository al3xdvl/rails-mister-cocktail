class Ingredient < ApplicationRecord
  has_many :doses
  belongs_to :cocktail

  validates :name, presence: true, allow_blank: false, uniqueness: true
end
