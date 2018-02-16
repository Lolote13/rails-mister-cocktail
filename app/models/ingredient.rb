class Ingredient < ApplicationRecord

  has_many :doses
  has_many :cocktails, through: :doses
  accepts_nested_attributes_for :doses

  validates :name, uniqueness: true, presence: true

  ingredient_array = []
  Ingredient.all.each do |ingredient|
    ingredient_array << [ingredient.name, ingredient.id]
  end

  INGREDIENTS = ingredient_array

end
