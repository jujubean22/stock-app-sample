class HomeController < ApplicationController
  def index
    @api = StockQuote::Stock.new(api_key: 'pk_3ee0242d059548e7bd3cfc8c9af1f467')
    if params[:ticker] == ''
      @nothing = "Hey! You Forgot to Enter a Symbol"
    elsif params[:ticker]
      begin
        @stocklogo=StockQuote::Stock.logo(params[:ticker])
        @stockcompany=StockQuote::Stock.company(params[:ticker])
      rescue RuntimeError
        @error = 'Hey! That Stock Symbol does not exist. Please try again'
      end
    end
  end

  def about
  end
end
