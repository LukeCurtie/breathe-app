class MoodsController < ApplicationController
  def index
    start_date = params.fetch(:date, Date.today).to_date
    @moods = Mood.where(date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
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
