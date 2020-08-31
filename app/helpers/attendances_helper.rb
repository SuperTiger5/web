module AttendancesHelper
  
  def attendance_state(attendance)
    if Date.current == attendance.worked_on
      return "出社" if attendance.started_at.nil?
      return "退社" if attendance.started_at.present? && attendance.finished_at.nil?
    end
    false
  end
  
  def working_times(start, finish)
    s = start.hour.to_f + format_minute_quarter(start).to_f / 60
    f = finish.hour.to_f + format_minute_quarter(finish).to_f / 60
    format("%.2f", f - s)
  end
  
  def format_minute_quarter(time)
    format("%i", 15 * (time.min / 15))
  end
  
  def attendances_invalid?
    a = true
      attendances_params.each do |id, item|
        if item[:started_at].blank? && item[:finished_at].blank?
          next
        elsif item[:started_at].blank? || item[:finished_at].blank?
          a = false
          break
        end
      end
      return a
  end

end
