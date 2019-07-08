class Processamento < ApplicationRecord
  enum status: [:iniciado, :finalizado, :cancelado]

  has_one :dado

  accepts_nested_attributes_for :dado


end
