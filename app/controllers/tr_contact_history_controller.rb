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
    from = Time.now.at_beginning_of_day
    to   = from + 1.day
    tr_contact_history = TrContactHistory.new(tr_params)
    if TrContactHistory.where(created_at: from...to).where(tr_params).present?
      # 値を更新するメソッド
    tr_contact_history.assign_attributes({contact_datetime: Time.now, contact_registration_type: 2, created_at: Time.now, updated_at: Time.now})
     else
      tr_contact_history.assign_attributes({contact_datetime: Time.now, contact_registration_type: 1, created_at: Time.now, updated_at: Time.now})
     end
     tr_contact_history.save
    redirect_to '/main'
  end

  private
  def tr_params
      params.require(:tr_contact_history).permit(:ms_hirise_staff_id)
      # { ms_hirise_staff_id: params[:ms_hirise_staff_id]}
  end
end
