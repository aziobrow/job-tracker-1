class ChangeCompaniesIdToCompanyIdInContacts < ActiveRecord::Migration[5.1]
  def change
    rename_column :contacts, :companies_id, :company_id
  end
end
