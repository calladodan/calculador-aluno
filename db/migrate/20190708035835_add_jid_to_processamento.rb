class AddJidToProcessamento < ActiveRecord::Migration[6.0]
  def change
    add_column :processamentos, :jid, :string
  end
end
