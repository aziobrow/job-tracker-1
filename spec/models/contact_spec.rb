require 'rails_helper'

RSpec.describe Contact do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without full name" do
        company = Company.create(name: "Publix")
        contact = Contact.create(company: company, position: "Manager", email: "whatever@muffins.com")

        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        company = Company.create(name: "Publix")
        contact = Contact.create(full_name: "Aurora", company: company, email: "whatever@muffins.com")

        expect(contact).to be_invalid
      end

      it "is invalid without an email" do
        company = Company.create(name: "Publix")
        contact = Contact.create(full_name: "Aurora", company: company, position: "Manager")

        expect(contact).to be_invalid
      end

    end

    context "valid attributes" do
      it "is valid with all attributes" do
        company = Company.create(name: "Publix")
        contact = Contact.create(full_name: "Aurora", company: company, position: "Manager", email: "whatever@muffins.com")

        expect(contact).to be_valid
      end
    end

    describe "relationships" do
      it "belongs to a company" do
        company = Company.create(name: "Publix")
        contact = Contact.new(full_name: "Aurora", company: company, position: "Manager")


        expect(contact).to respond_to(:company)
      end
    end

  end
end
