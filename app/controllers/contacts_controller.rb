class ContactsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.create(contact_params)

    redirect_to company_jobs_path(@company)
  end

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email, :company_id)
  end
end
