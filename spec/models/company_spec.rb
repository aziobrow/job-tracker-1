require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end

    it "has many contacts" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:contacts)
    end

  end

  describe 'Class Methods' do
    it 'finds top three companies ranked by associated jobs average level of interest' do
      category = Category.create(title: "Web Development")
      company1 = Company.create(name: "Dropbox")
      company2 = Company.create(name: "Turing")
      company3 = Company.create(name: "DPS")
      company4 = Company.create(name: "Walmart")
      Job.create(title: "Jr Developer", level_of_interest: 50, city: "Denver", company: company2, category: category)
      Job.create(title: "Sr Developer", level_of_interest: 70, city: "Denver", company: company2, category: category)
      Job.create(title: "Website Maintenance", level_of_interest: 10, city: "Denver", company: company1, category: category)
      Job.create(title: "CTO", level_of_interest: 100, city: "Denver", company: company4, category: category)
      Job.create(title: "Tech Teacher", level_of_interest: 0, city: "Denver", company: company3, category: category)
      top_three = Company.top_three_companies_by_jobs_average_interest

      expect(top_three.count).to eq(4)
      expect(top_three.first.name).to eq("Walmart")
      expect(top_three.first.avg_interest).to eq("100")
      expect(top_three.second.name).to eq("Turing")
      expect(top_three.second.avg_interest).to eq(60)
      expect(top_three.last.name).to eq("Dropbox")
      expect(top_three.last.name).to eq(10)
    end
  end
  
end
