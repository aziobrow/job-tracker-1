require 'rails_helper'

describe "User sees all categories" do
  it "user sees all categories" do
    Category.create(title: "Web Development")
    Category.create(title: "Education")

    visit categories_path

    expect(page).to have_content("Web Development")
    expect(page).to have_content("Education")
  end
end
