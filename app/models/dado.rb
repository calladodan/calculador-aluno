class Dado < ApplicationRecord
  has_one_attached :arquivo

  has_many :registros
end
