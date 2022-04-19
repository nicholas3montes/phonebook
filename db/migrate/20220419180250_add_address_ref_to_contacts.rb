class AddAddressRefToContacts < ActiveRecord::Migration[7.0]
  def change
    add_reference :contacts, :address, foreign_key: true
  end
end
