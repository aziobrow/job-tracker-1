require 'rails_helper'

describe "User edits an existing job" do
  it "sees an edit form" do
    company = Company.create(name: "ESPN")
    job = company.jobs.create(title: "Senior Dev", description: "Do important dev stuff", level_of_interest: 85, city: "Denver")

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Junior Dev"
    click_button "Update"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Junior")
    expect(page).to_not have_content("Senior")
  end
end
