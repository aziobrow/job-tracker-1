require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, city, company, and category" do
        company = Company.new(name: "Turing")
        category = Category.new(title: "Web Development")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end

    it "belongs to a category" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:category)
    end

    it "has many comments" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:comments)
    end
  end

  describe 'Class Methods' do
    it 'counts jobs per level of interest' do
      category = Category.create(title: "Web Development")
      company = Company.create(name: "Dropbox")
      Job.create(title: "Jr Developer", level_of_interest: 50, city: "Denver", company: company, category: category)
      Job.create(title: "Sr Developer", level_of_interest: 70, city: "Denver", company: company, category: category)
      Job.create(title: "Website Maintenance", level_of_interest: 50, city: "Denver", company: company, category: category)
      ordered_jobs = Job.count_by_level_of_interest

      expect(ordered_jobs.keys).to eq([50, 70])
      expect(ordered_jobs.values).to eq([2, 1])
    end

    it 'counts jobs by location' do
      category = Category.create(title: "Web Development")
      company = Company.create(name: "Dropbox")
      Job.create(title: "Jr Developer", level_of_interest: 50, city: "Denver", company: company, category: category)
      Job.create(title: "Sr Developer", level_of_interest: 70, city: "Atlanta", company: company, category: category)
      Job.create(title: "Website Maintenance", level_of_interest: 50, city: "Denver", company: company, category: category)
      ordered_jobs = Job.count_by_location

      expect(ordered_jobs.keys).to eq(["Atlanta", "Denver"])
      expect(ordered_jobs.values).to eq([1, 2])
    end
  end
end
