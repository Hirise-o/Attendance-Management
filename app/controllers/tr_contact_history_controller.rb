require "date"
require 'active_support/all'

class TrContactHistoryController < ApplicationController
  def main #viewの行き先
    @today = Date.today.strftime('%Y年%m月%d日')
    @history = TrContactHistory.new
    @staffs = MsHiriseStaff.all
  end

  def create
    tr_contact_history = TrContactHistory.new(tr_params)
    if @today.present?
      tr_contact_history.contact_registration_type = 2
      tr_contact_history.contact_datetime =Date.today
      tr_contact_history.save
    else
      tr_contact_history.contact_registration_type = 1
      tr_contact_history.contact_datetime =Date.today
      tr_contact_history.save
    end
    redirect_to '/top'
  end

  private
  def tr_params
      params.permit(:staff_no, :contact_registration_type, :contact_datetime, Date.today)
  end
end
