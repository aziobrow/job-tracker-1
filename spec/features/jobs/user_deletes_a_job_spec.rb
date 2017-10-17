require 'rails_helper'

describe "User deletes existing job" do
  it "a user can delete a company" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Web Development")
    job = company.jobs.create(title: "Senior Dev", description: "Do important dev stuff", level_of_interest: 85, city: "Denver", category: category)

    visit company_jobs_path(company)

    within(".company_jobs") do
      click_link "Delete"
    end

    expect(page).to have_content("ESPN: Senior Dev was successfully deleted!")
  end
end
