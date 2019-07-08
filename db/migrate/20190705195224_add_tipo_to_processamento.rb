class AddTipoToProcessamento < ActiveRecord::Migration[6.0]
  def change
    add_column :processamentos, :tipo, :string
  end
end
