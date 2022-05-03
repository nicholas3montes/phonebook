class Address < ApplicationRecord
    has_one :contact
    validates :street, :number, :city, presence: true 
end
