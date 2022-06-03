class Api::V1::ContactsController < Api::V1::ApiController 

    def index
        contacts = ContactsServices.new.list_all_contacts
        render json: contacts, status: 200
    end 

    def show
        contact = ContactsServices.new.find_contact_by_id(params[:id])
        render json: contact, status: 200
    
      rescue ActiveRecord::RecordNotFound
        render status: 404, json: {}
    end

    def create
        contact = ContactsServices.new.create_contact(contact_params)
        render status: 201, json: contact
    end

    def update
        contact = ContactsServices.new.update_contact(params[:id], contact_params)
        render status: 205, json: contact
    end


    def destroy
        contact = ContactsServices.new.destroy_contact(params[:id])
        render status: 204, json: contact
    end

    private
    def contact_params
      params.require(:contact).permit(:name, :phone, :birthdate, address_attributes:[:city, :number, :street])
    end
end