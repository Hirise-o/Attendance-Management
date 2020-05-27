class CsvController < ApplicationController
def create
  @csv = TrContactHistory.new
  @time = TrContactHistory.all
  end
end
