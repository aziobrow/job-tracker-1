class DashboardController < ApplicationController
  def index
    @companies = Company.all
    @jobs = Job.all
  end
end
