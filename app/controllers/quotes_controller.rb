class QuotesController < ApplicationController
  def index
      @quote_today = Quote.last
      @quotes = Quote.order(publish_date: :desc).drop(1).first(7)
  end



end
