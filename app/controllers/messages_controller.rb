class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])

    @therapist_id = @chatroom.therapist_id
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        message: render_to_string(partial: "message", locals: { message: @message }),
        sender_id: @message.user.id,
        name: @message.user.name
      )
      head :ok
    end

  end

  private

  def message_params
    params.require(:message).permit(:content, :user, :chatroom_id)
  end
end
