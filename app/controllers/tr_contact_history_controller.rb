require "date"

class TrContactHistoryController < ApplicationController
  def main #viewの行き先
    @today = Date.today.strftime('%Y年%m月%d日')
  end
end
