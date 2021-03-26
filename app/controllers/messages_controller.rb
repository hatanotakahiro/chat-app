class MessagesController < ApplicationController
  def index
    # ・空のMessageモデルのインスタンス情報
    @message = Message.new

    # ・paramsに含まれているチャットルームのレコード情報
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user).order("created_at DESC")
  end
  def create
    @room = Room.find(params[:room_id])
    # roomと紐づいて作成（よってストロングパラメータでroom記述する必要なし？←違う、form_withで取ってきてないから）
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      # renderだと@messagesの情報がなくなるので必要
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
