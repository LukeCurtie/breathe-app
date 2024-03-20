class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @therapist = Therapist.find(params[:therapist_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
