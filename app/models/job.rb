class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.parse_params(params)
    if params[:location]
      @jobs = where(city: params[:location])
    elsif params[:sort] == "location"
      @jobs = order(:city)
    elsif params[:sort] == "interest"
      @jobs = order(level_of_interest: "DESC")
    else
      @jobs = all
    end
  end

  def self.count_by_level_of_interest
    group(:level_of_interest)
    .order(:level_of_interest)
    .count
  end

  def self.count_by_location
    group(:city)
    .order("count_id")
    .count(:id)
  end


end
