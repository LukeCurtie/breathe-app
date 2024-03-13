class MoodsController < ApplicationController
  def index
    @moods = Mood.all
  end

  def create
    @mood = Mood.new(mood_params)
    @mood.date = Date.current
    @mood.user = current_user
    if @mood.save
      redirect_to root_path
    end
  end

  private

  def mood_params
    params.require(:mood).permit(:emotion, :date)
  end
end
