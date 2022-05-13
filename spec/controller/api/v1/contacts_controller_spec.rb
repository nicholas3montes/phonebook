require 'rails_helper'

describe 'ContactsController', type: :request do
    context 'index' do
        it 'deve retornar status 200' do
            get api_v1_contacts_path

            expect(response).to have_http_status(200)
        end

        it 'deve retornar todas as tarefas' do
            # Setup
            address = Address.create!(city:'são paulo', number:'8', street:'rua gouveia')
            address1 = Address.create!(city:'são paulo', number:'18', street:'rua pamplona')
            contact = Contact.create!(name:'Etevaldo', phone: '954826482', birthdate:'25-6-1985', address: address)
            other_contact = Contact.create!(name:'jeovaildo', phone: '9545368135', birthdate:'18-8-1971', address:address1)
            

            # Execution
            get api_v1_contacts_path

            # Expectations
            expect(response).to have_http_status(200)
            expect(response.body).to include contact.name
            expect(response.body).to include contact.phone
            expect(response.body).to include other_contact.name
            expect(response.body).to include other_contact.phone
        end
    end
    context 'show' do
        it 'deve retornar uma tarefa' do
            # Setup
            address1 = Address.create!(city:'são paulo', number:'18', street:'rua pamplona')
            contact = Contact.create!(name:'Etevaldo', phone: '954826482', birthdate:'25-6-1985', address: address1)
            
            # Execution
            get api_v1_contacts_path(contact)
            
            # Expectations
            expect(response).to have_http_status(200)
            expect(response.body).to include contact.name
            expect(response.body).to include contact.phone
        end
    
        it 'deve retornar not found se tarefa indisponível' do
            # Execution
            get api_v1_contact_path(id:999)
    
            # Expectations
            expect(response).to have_http_status(:not_found)
        end
    end

    context 'post' do
        it 'deve criar tarefa' do
            # Setup
            address1 = { city:'são paulo', number:'18', street:'rua pamplona' }
            contact = { name: 'valdo', phone: '9854726482',  birthdate: '25-6-1985', address: address1 }
            
            # Execution
            post api_v1_contacts_path, params: contact

            # Expectations
            expect(response).to have_http_status(201)
            expect(response.body).to include('valdo')
            expect(response.body).to include('9854726482')
            expect(Contact.last.name).to eq('valdo')
        end
    end

    context 'destroy' do
        it 'deve deletar' do
            # Setup
            address1 = Address.create!( city:'são paulo', number:'18', street:'rua pamplona' )
            contact = Contact.create!( name: 'valdo', phone: '9854726482',  birthdate: '25-6-1985', address: address1 )
            
            # Execution
            delete api_v1_contact_path(contact)

            # Expectations
            expect(Contact.exists?(contact.id)).to be false
            expect(response).to have_http_status(204)
            
        end
    end
    context 'update' do
        it 'atualização' do
            # Setup
            address1 = Address.create!( city:'são roque', number:'38', street:'rua campinas' )
            contact = Contact.create!( name: 'genival', phone: '9854726552',  birthdate: '15-2-1988', address: address1 )
            contact.name = 'Helder'
            address1.city = 'Manaus'
            
            # Execution
            put api_v1_contact_path(contact)

            # Expectations
            expect(contact.name).to include('Helder')
            expect(address1.city).to include('Manaus')
        end
    end
end
