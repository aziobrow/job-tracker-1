require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "Validations" do
    context "invalid_attributes" do
      it "is invalid without a title" do
        category = Category.create()

        expect(category).to_not be_valid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        category = Category.create(title: "Thing 1")

        expect(category).to be_valid
      end
    end

    describe "relationships" do
      it "has many jobs" do
        category = Category.new(title: "Biologist")
        expect(category).to respond_to(:jobs)
      end
    end
  end
end
