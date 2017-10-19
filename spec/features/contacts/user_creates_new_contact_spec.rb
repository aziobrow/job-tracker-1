require 'rails_helper'

describe "User creates a new contact" do
  it "a user can add a new company contact" do
    company = Company.create(name: "ESPN")

    visit company_path(company)

    fill_in "contact[full_name]", with: "Aurora Ziobrowski"
    fill_in "contact[position]", with: "Teacher"
    fill_in "contact[email]", with: "aurora@turing.com"
    click_button "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Aurora Ziobrowski")
    expect(page).to have_content("Teacher")
    expect(page).to have_content("aurora@turing.com")
    expect(page).to have_content("Contacts (1)")

  end
end
