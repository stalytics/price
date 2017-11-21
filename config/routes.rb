Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  scope :ISteamItems_730 do
    get '/CurrentPrice/v1/:market_hash_name', to: 'items730/current_price#v1'
    get '/AveragePrice/v1/:market_hash_name', to: 'items730/average_price#v1'
    get '/GetItemsList/v1/', to: 'items730/get_items_list#v1' #пагинацию тут надо сделать и параметр per_page?
  end
end
