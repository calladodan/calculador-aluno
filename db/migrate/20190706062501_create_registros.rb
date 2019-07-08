class CreateRegistros < ActiveRecord::Migration[6.0]
  def change
    create_table :registros do |t|
      t.references :dado, null: false, foreign_key: true
      t.string :matricula
      t.integer :nota
      t.integer :ch

      t.timestamps
    end
  end
end
