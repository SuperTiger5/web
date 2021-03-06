class AttendancesController < ApplicationController
  include AttendancesHelper
  
  before_action :set_user, only: [:edit_one_month, :update_one_month]
  before_action :logged_in_user
  before_action :admin_or_correct_user, except: [:update_request, :update_approval, :cancel_request, :request_users,
                                                 :approval_users, :update_approval, :cancel_approval, :request_users]
  before_action :admin_user, only: [:update_approval, :cancel_approval, :request_users, :approval_users]
  before_action :set_one_month, only: :edit_one_month
  before_action :set_overtime, only: [:update_request, :update_approval, :cancel_request, :cancel_approval]
  
  UPDATE_ERROR_MSG = "勤怠登録に失敗しました。やり直してください。"
  
  def update
    @user = User.find(params[:user_id])
    @attendance = Attendance.find(params[:id])
    if @attendance.started_at.nil?
      if @attendance.update_attributes(started_at: Time.current.change(sec: 0))
        flash[:info] = "おはようございます。"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    elsif @attendance.finished_at.nil?
      if @attendance.update_attributes(finished_at: Time.current.change(sec: 0))
        flash[:info] = "おつかれさまでした。"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    end
    redirect_to @user
  end
  
  def edit_one_month
  end
  
  def update_one_month
    ActiveRecord::Base.transaction do
      if attendances_invalid?
        attendances_params.each do |id, item|
          attendance = Attendance.find(id)
          attendance.update_attributes!(item)
        end
        flash[:success] = "1ヶ月分の勤怠情報を更新しました。"
        redirect_to user_url(date: params[:date])
      else
        flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
        redirect_to attendances_edit_one_month_user_url(date: params[:date])
      end
    end
  rescue ActiveRecord::RecordInvalid
      flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
      redirect_to attendances_edit_one_month_user_url(date: params[:date])
  end
  
  def request_users
    @attendances = Attendance.where(worked_on: Date.current, overtime_request: "1", overtime_approval: nil)
  end
  
  def update_request
    @attendance.update_attributes!(overtime_request: "1")
    flash[:success] = "管理者に残業申請しました。"
    redirect_to user_url(@user)
  end
  
  def approval_users
    @attendances = Attendance.where(worked_on: Date.current, overtime_approval: "1")
  end
  
  def update_approval
    @attendance.update_attributes!(overtime_approval: "1")
    @user = User.find(@attendance.user_id)
    flash[:success] = "#{@user.name}の残業申請を承認しました。"
    redirect_to @user
  end
  
  def cancel_request
    @attendance.update_attributes(overtime_request: nil)
    flash[:danger] = "残業申請をキャンセルしました。"
    redirect_to @user
  end
  
  def cancel_approval
    @attendance.update_attributes(overtime_request: nil, overtime_approval: nil)
    @user = User.find(@attendance.user_id)
    flash[:danger] = "#{@user.name}の残業承認を取り消しました。"
    redirect_to @user
  end
  
  private
  
    def attendances_params
      params.require(:user).permit(attendances: [:started_at, :finished_at, :note])[:attendances]
    end
    
    def admin_or_correct_user
      @user = User.find(params[:user_id]) if @user.blank?
      unless current_user?(@user) || current_user.admin?
        flash[:danger] = "編集権限がありません"
        redirect_to(root_url)
      end
    end
    
    def set_overtime
      @user = User.find(params[:user_id])
      @attendance = Attendance.find(params[:id])
    end
    
end
