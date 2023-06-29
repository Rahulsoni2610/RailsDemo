class AddColumnToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :password, :integer
  end
end
