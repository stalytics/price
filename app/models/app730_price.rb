class App730Price < ApplicationRecord

  has_one :app730_item, :foreign_key => :id, :primary_key => :item_id
  has_one :currency, :foreign_key => :id, :primary_key => :currency_id

end
