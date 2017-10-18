class Dashboard < ApplicationRecord

  def self.count_by_level_of_interest
    Job.group(:level_of_interest)
    .order(:level_of_interest)
    .count
  end

  def average_level_of_interest_by_company (company model, for each)
    jobs
    .average(:level_of_interest)
  end
end
