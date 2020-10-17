class MsgsController < ApplicationController

  def edit
    @msg = Msg.find(params[:id])
  end
  
  def update
    @msg = Msg.find(params[:id])
    @msg.update_attributes(accept)
    flash[:success] = "意見を編集しました。"
    redirect_to msgs_path
  end
  
  def index
    @msgs = Msg.all
  end
  
  def show
    @msg = Msg.find(params[:id])
  end
  
  def destroy
    @msg = Msg.find(params[:id])
    @msg.desttroy
    flash[:danger] = "投稿を削除しました。"
  end

  
  private
   
    def accept
      params.require(:msg).permit(:message)
    end
end
