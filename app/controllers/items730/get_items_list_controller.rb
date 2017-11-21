module Items730
  class GetItemsListController < ApplicationController
    def v1
      page          = (params[:page]     || 1  ).to_i
      per_page      = (params[:per_page] || 100).to_i
      currency_code = params[:currency]  || 'RUB'

      offset = (page - 1) * per_page

      items       = App730Item.all.limit(per_page).offset(offset)
      currency    = Currency.where(:code => currency_code).first
      items_count = App730Item.all.count

      if items.nil? || currency.nil? || items.empty?
        @result = { :success => false }
      else
        @result = {
            :success => true,
            :data => {
                :total          => items_count,
                :per_page       => per_page,
                :current_page   => page,
                :last_page      => (items_count / per_page.to_f).ceil,
                :items          => items.map do |i|
                  {
                      :market_hash_name => i.market_hash_name,
                      :amount           => i.app730_price.where(:currency_id => currency.id).average(:amount).to_f || nil,
                      :currency         => currency.code
                  }
                end
            }
        }
      end

      render json: @result
    end
  end
end
