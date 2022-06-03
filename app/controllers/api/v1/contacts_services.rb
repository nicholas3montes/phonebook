class Api::V1::ContactsServices

    def list_all_contacts
        Contact.all
    end

    def find_contact_by_id(contact_id)
        Contact.find(contact_id)
    end

    def new_contact
        contact = Contact.new
    end

    def create_contact(contact_params)
        contact = Contact.new(contact_params)
        contact.save
    end

    def edit_contact(contact_id)
        contact = Contact.find(contact_id)
    end

    def update_contact(contact_id, contact_params)
        contact = Contact.find(contact_id)
        contact.update(contact_params)
    end

    def destroy_contact(contact_id)
        contact = Contact.find(contact_id)
        contact.destroy
    end
end