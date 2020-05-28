class CsvController < ApplicationController
def create
  @csv = TrContactHistory.new
  end
end
