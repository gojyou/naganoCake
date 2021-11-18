class Address < ApplicationRecord
   belongs_to :customer

   def full_address
    '〒' + postal_code.to_s + ' ' + address + ' ' + name
end
end
