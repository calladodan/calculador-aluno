class CreateDados < ActiveRecord::Migration[6.0]
  def change
    create_table :dados do |t|
      t.integer :status

      t.timestamps
    end
  end
end
