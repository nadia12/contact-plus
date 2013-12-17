class AddGroupIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :group_id, :string
  end
end
