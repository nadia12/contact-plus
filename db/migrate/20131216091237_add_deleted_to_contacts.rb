class AddDeletedToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :deleted, :boolean, default: 0
  end
end
