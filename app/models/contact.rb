class Contact < ApplicationRecord
    belongs_to :address
    accepts_nested_attributes_for :address
    validates :name, :phone, :birthdate, presence: true
    
    def self.search(query)
        where("name like?", "%#{query}%")
    end
end
