require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Validations" do
    it "is invalid without a title" do
      category = Category.create()

      expect(category).to_not be_valid
    end
  end
end
