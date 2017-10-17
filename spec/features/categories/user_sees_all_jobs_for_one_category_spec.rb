require 'rails_helper'

describe "User sees all jobs for one category" do
  it "a user sees a list of jobs" do
    company = Company.create(name: "ESPN")
    category = Category.create(title: "Web Development")
    job = Job.create(title: "Developer", description: "doing stuff", level_of_interest: 90, city: "Denver", category: category, company: company)

    visit category_job_path(category, job)

    expect(current_path).to eq("/categories/#{category.id}/jobs/#{job.id}")
    expect(page).to have_content("Developer")
  end
end
