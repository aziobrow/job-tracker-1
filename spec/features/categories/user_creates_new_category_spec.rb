require 'rails_helper'

describe "User creates a new category" do
  it "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Education"
    click_button "Create"

    expect(current_path).to eq(category_path(Category.last))
    expect(page).to have_content("Education")
    expect(Category.count).to eq(1)
  end
end
