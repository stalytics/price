module Items730
  class AveragePriceController < ApplicationController
    def v1
      market_hash_name = params[:market_hash_name]
      period           = params[:period]   || 7
      currency_code    = params[:currency] || 'RUB'

      item = App730Item.where(:market_hash_name => market_hash_name).first

      currency = Currency.where(:code => currency_code).first

      date_f = (Time.now - period.days).strftime("%Y-%m-%d 00:00:00")
      date_t = Time.now.strftime("%Y-%m-%d 23:59:59")

      avg_price = item.app730_price.where('created_at BETWEEN ? AND ?', date_f, date_t).where(:currency_id => currency.id).average(:amount)

      if avg_price.nil?
        @result = { :success => false }
      else
        @result = {
            :success => true,
            :data    => {
                :market_hash_name => market_hash_name,
                :currency         => currency.code,
                :amount           => avg_price.to_f.round(2),
                :date_f           => date_f,
                :date_t           => date_t
            }
        }
      end

      render json: @result
    end
  end
end