class Dashboard < ApplicationRecord

  def self.count_by_level_of_interest
    Job.group(:level_of_interest)
    .order(:level_of_interest)
    .count
  end

  # def average_level_of_interest_by_company (company model, for each)
  #   joins(:jobs)
  #     .select("average(level_of_interest) AS avg_interest, company.id")
  #     .group("company.id")
  #     .order("avg_interest")
  # end

  def average_level_of_interest_by_company
    .average(:level_of_interest)
    .limit(3)
  end
end
