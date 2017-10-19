require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        category = Category.create(title: "Grocer")
        company = Company.create(name: "Publix")
        job = Job.new(title: "Cashier", level_of_interest: 40, city: "Denver", company: company, category: category)

        comment = Comment.create(job: job)
      end
    end

    context "valid attributes" do
      it "is valid with all attributes" do
        category = Category.create(title: "Grocer")
        company = Company.create(name: "Publix")
        job = Job.new(title: "Cashier", level_of_interest: 40, city: "Denver", company: company, category: category)
        comment = Comment.create(content: "This is fine", job: job)

        expect(comment).to be_valid
      end
    end

    describe "relationships" do
      it "belongs to a job" do
        category = Category.create(title: "Grocer")
        company = Company.create(name: "Publix")
        job = Job.new(title: "Cashier", level_of_interest: 40, city: "Denver", company: company, category: category)

        comment = Comment.create(job: job)
      end
    end

  end
end
