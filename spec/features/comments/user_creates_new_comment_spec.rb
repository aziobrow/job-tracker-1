require 'rails_helper'

describe "User creates a new comment" do
  it "a user can add a comment" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Web Development")
    job = company.jobs.create(title: "Senior Dev", description: "Do important dev stuff", level_of_interest: 85, city: "Denver", category: category)

    visit company_job_path(company, job)

    fill_in "comment[content]", with: "Maisy says hi"
    click_button "Create Comment"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("Maisy says hi")
    expect(page).to have_content("Comments (1)")
  end
end
