class Api::V1::ContactsController < Api::V1::ApiController 

    def index
        @contacts = Contact.all
        render json: @contacts, status: 200
    end 

    def show
        @contacts = Contact.find(params[:id])
        render status: 200, json: @contact
    
      rescue ActiveRecord::RecordNotFound
        render status: 404, json: {}
    end

    def create
        @address = Address.create!(address_params)
        @contact = Contact.create!(contact_params.merge({address_id: @address.id}))
        render status: 201, json: @contact
    end

    def update
        @contact = Contact.find(params[:id])
        @contact.update(contact_params)
        render status: 205, json: @contact
    end


    def destroy
        @contact = Contact.find(params[:id])
        @contact.destroy!
        render status: 204, json: @contact
    end

    private

    def contact_params                                                                
        params.permit(:name, :phone, :birthdate)
    end 

    def address_params                                                                
        params.require(:address).permit(:city, :number, :street)
    end 
end