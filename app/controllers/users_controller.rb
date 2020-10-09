class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :edit, :update, :edit_basic_info, :update_basic_info]
  before_action :logged_in_user, only: [:show, :index, :destroy, :edit, :update]
  before_action :admin_user, only: [:index, :destroy, :edit_basic_info, :update_basic_info, :working_user]
  before_action :admin_or_correct_user, only: :show
  before_action :set_one_month, only: :show
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "新規作成に成功しました。"
      redirect_to @user
    else
      render :new
    end
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20).search(params[:search])
  end
  

  
  def show
    @worked_sum = @attendances.where.not(started_at: nil, finished_at: nil).count
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を編集しました。"
      redirect_to @user
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def edit_basic_info
  end

  def update_basic_info
    if @user.update_attributes(basic_info_params)
      if User.update_all(basic_time: @user.basic_time, work_time: @user.work_time)
        flash[:success] = "基本情報を更新しました。"
      else
        flash[:danger] = "基本情報を更新できませんでした"
      end
    else
      flash[:danger] = "基本情報の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
    redirect_to users_url
  end
  
  def working_user
    @attendances = Attendance.where(worked_on: Date.current).where.not(started_at: nil).where(finished_at: nil)
  end
  
  

  private
    
    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
    end
    
    def basic_info_params
      params.require(:user).permit(:department, :basic_time, :work_time)
    end
    
    def admin_or_correct_user
      redirect_to root_url unless current_user.admin? || @user == current_user
    end
end
