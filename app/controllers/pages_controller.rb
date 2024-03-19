class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

    @quote = Quote.all.sample

    @moods = [
      {
        name: "Joyful"
      },
      {
        name: "Happy"
      },
      {
        name: "Numb"
      },
      {
        name: "Sad"
      },
      {
        name: "Angry"
      },
      {
        name: "Anxious"
      }
    ]

    @mood = Mood.find_by(user: current_user, date: Date.current)
    @thismood = "How are you feeling?"
    if @mood == nil
      @mood = Mood.new
    else

      case @mood.emotion

      when "Joyful"
        @thismood = "You feel joyful today"

      when "Happy"
        @thismood = "You feel happy today"

      when "Numb"
        @thismood = "You feel numb today"

      when "Sad"
        @thismood = "You feel sad today"

      when "Angry"
        @thismood = "You feel angry today"

      when "Anxious"
        @thismood = "You feel anxious today"
      end
    end
  end

  def aichat

  end
end
