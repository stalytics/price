class App730Item < ApplicationRecord

  has_many :app730_price, :foreign_key => :item_id, :primary_key => :id

end
