class Coin < ApplicationRecord
  belongs_to:mining_type #, optional:true -> pode iniciar como nil
end
