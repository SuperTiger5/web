module UsersHelper
  
   # 勤怠基本情報を指定のフォーマットで返す。  
  def format_basic_info(time)
    format("%.2f", ((time.hour * 60) + time.min) / 60.0)
  end
  
  def sunday_or_saturday_color(x)
    css_class = 
          case $days_of_the_week[x.worked_on.wday]
            when '土'
              'text-primary'
            when '日'
              'text-danger'
          end
    return css_class
  end
  
  def index_place(x)
    @users = User.where(work_place_of_user: x).paginate(page: params[:page], per_page: 20).search(params[:search])
  end
  
  def work
    @attendances = Attendance.where(finished_at: nil, worked_on: Date.current).where.not(started_at: nil, )
  end
  
  def request_users_num
    attendances = Attendance.where(worked_on: Date.current, overtime_request: "1", overtime_approval: nil)
    @num = attendances.count
  end
  
  def approval_users_num
    attendances = Attendance.where(worked_on: Date.current, overtime_approval: "1")
    @num = attendances.count
  end
  
end
