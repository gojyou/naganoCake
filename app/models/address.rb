class Address < ApplicationRecord
   belongs_to :customer
   belongs_to :order

   def full_address
    '〒' + postal_code.to_s + ' ' + address + ' ' + name
end
end
