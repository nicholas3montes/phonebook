class ContactsController < ApplicationController
  
  def index
    @contacts = Contact.all
  end
  
  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
    @contact.build_address
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to action: :show
    end
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to action: :index
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      redirect_to action: :index
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :phone, :birthdate, address_attributes:[:city, :number, :street])
    end

end
