require "date"
require 'active_support/all'

class TrContactHistoryController < ApplicationController
  def main #viewの行き先
    @today = Date.today.strftime('%Y年%m月%d日')
    @history = TrContactHistory.new
    @staffs = MsHiriseStaff.all
  end

  def create
    # byebug
    tr_contact_history = TrContactHistory.new({**tr_params, contact_datetime: Date.today, contact_registration_type: 1,created_at: Date.today, updated_at: Date.today})
    tr_contact_history.save
    redirect_to '/top'
  end

  private
  def tr_params
      { staff_no: params[:staff_no]}
  end
end
