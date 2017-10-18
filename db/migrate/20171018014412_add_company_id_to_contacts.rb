class AddCompanyIdToContacts < ActiveRecord::Migration[5.1]
  def change
    add_reference :contacts, :companies, index: true, foreign_key: true
  end
end
