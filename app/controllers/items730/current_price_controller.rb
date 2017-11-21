module Items730
  class CurrentPriceController < ApplicationController
    def v1

      currency_code = params[:currency] || 'RUB'
      date = params[:date] ||  Time.now.strftime("%Y-%m-%d")
      market_hash_name = params[:market_hash_name]

      currency_id = Currency.where(:code => currency_code)

      item = App730Item.where(:market_hash_name => market_hash_name).first

      unless item.nil?
        price = item.app730_price.where('created_at <= ?', date + '23:59:59').where(:currency_id => currency_id).order(created_at: :desc).first
      end

      if price.nil? || item.nil?
        @result = {
            :success => false
        }
      else
        @result = {
            :success => true,
            :data    => {
                :currency => currency_code,
                :amount   => price.amount.to_f,
                :volume   => price.volume,
                :date     => price.created_at
            }
        }
      end

      render json: @result

    end
  end
end
