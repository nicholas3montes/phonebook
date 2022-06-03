class ContactsController < ApplicationController

  def show
    @contact = ContactsServices.new.find_contact_by_id(params[:id])
  end

  def index
    if params[:search] 
      @contacts = Contact.search(params[:search])
    else
      @contacts = ContactsServices.new.list_all_contacts
    end
  end

  def new
    @contact = ContactsServices.new.new_contact
    @contact.build_address
  end

  def create
    @contact = ContactsServices.new.create_contact(contact_params)
    redirect_to action: :index
  end

  def edit
    @contact = ContactsServices.new.edit_contact(params[:id])
  end

  def update
    @contact = ContactsServices.new.update_contact(params[:id], contact_params)
    redirect_to action: :index
  end

  def destroy
    @contact = ContactsServices.new.destroy_contact(params[:id])
    redirect_to action: :index
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :phone, :birthdate, address_attributes:[:city, :number, :street])
  end
end
