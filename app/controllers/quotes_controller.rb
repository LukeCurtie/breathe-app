class QuotesController < ApplicationController
  def index

    @quote = Quote.where(publish_date: Date.today).sample
    @quotes = Quote.order(publish_date: :desc).limit(3)
  end



end
