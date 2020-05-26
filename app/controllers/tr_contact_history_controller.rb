require "date"
require 'active_support/all'
require 'mysql2'
require 'csv'

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

      def csv
      #Mysql接続
      client = Mysql2::Client.new(
        host: "localhost",
        username: "root",
        password: '',
        database: "AM_app_production",
        :encoding => 'utf8',
        stream: true,
        cache_rows: false,
      )

      @results = client.query(
        "select 
          ms.staff_no, ms.staff_name, 
          DATE_FORMAT(contact_datetime,'%Y/%m/%d'),
          GROUP_CONCAT(TIME_FORMAT(tr.created_at, '%h時%i分'))
           from 
            ms_hirise_staffs as ms inner join tr_contact_histories as tr 
            on tr.ms_hirise_staff_id = ms.staff_no
             where
              tr.created_at
               in (select max(created_at) from tr_contact_histories
                group by 
                 contact_registration_type, tr_contact_histories.ms_hirise_staff_id)
                 group by
                  ms.staff_no, ms.staff_name, contact_datetime

       ")

      send_posts_csv(@results)
     # send_data render_to_string, filename: "出退勤管理シート.csv", type: :csv
      # results.each do |result|
       # puts result
      # end
        # CSV.open("tr_contact_histories.csv", "w") do |csv|
        # csv << results.fields
        # results.each do |row|
        #   csv << row.values
        # end
      # end
      # send_data(csv_data, filename: "tr_contact_history.csv")
      end

      def send_posts_csv(results)
        csv_data = CSV.generate do |csv|
          header = %w(社員番号 社員名 出勤年月日 出勤時間 退勤時間)
          csv << header

          results.each do |result|
            csv << result.values
          end
        
      end
      send_data(csv_data, filename: "Timesheet.csv")
    end
  private
  def tr_params
      params.require(:tr_contact_history).permit(:ms_hirise_staff_id)
      # { ms_hirise_staff_id: params[:ms_hirise_staff_id]}
  end
end
