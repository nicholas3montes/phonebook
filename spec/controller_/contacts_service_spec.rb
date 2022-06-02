require 'rails_helper'
describe 'ContactsServices', type: :model do
    context 'find_contact_by_id' do
        it 'when contact can exist' do
            # Setup
            address = Address.create!(city:'são paulo', number:'8', street:'rua gouveia')
            contact = Contact.create!(name:'lucas', phone: '954826482', birthdate:'25-6-1985', address: address)
            # Execution
            contact_result = ContactsServices.new.find_contact_by_id(contact.id)
            # Expectations
            expect(contact_result.id).to eq(contact.id)
            expect(contact_result).to eq(contact)
            expect(contact.name).to include 'lucas'
        end
        it 'when attribute is invalid' do
            # Setup
            address = Address.create!(city:'são paulo', number:'8', street:'rua gouveia')
            contact = Contact.create!(name:'lucas', phone: '954826482', birthdate:'25-6-1985', address: address)
            not_found_id = 138
            # Execution
            binding.pry
            contact_result = ContactsServices.new.find_contact_by_id(contact.id)
            # Expectations
            expect(contact_result).to eq(contact)
        end
    end
end