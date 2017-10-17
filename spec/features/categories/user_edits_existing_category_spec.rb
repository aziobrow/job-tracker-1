require 'rails_helper'

describe "User edits an existing category" do
  it "a user can edit a category" do
    category = Category.create(title: "Web Development")
    visit edit_category_path(category)

    fill_in "category[title]", with: "Education"
    click_button "Update"

    expect(current_path).to eq(edit_category_path(category))
    expect(page).to have_content("Education")
    expect(page).to_not have_content("Web Development")
  end
end
