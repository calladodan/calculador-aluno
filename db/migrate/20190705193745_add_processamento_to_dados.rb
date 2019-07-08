class AddProcessamentoToDados < ActiveRecord::Migration[6.0]
  def change
    add_reference :dados, :processamento, null: false, foreign_key: true
  end
end
