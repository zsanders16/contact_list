@contacts = Array.new
@continue = true

def display_menu
    puts "--- Contact List Menu ---"
    puts "1) All Contacts"
    puts "2) Create Contact"
    puts "3) Edit Contact"
    puts "4) Delete Contact"
    puts "5) Quit\n\n"

    puts "Please select an number." 
    input_eval 
end

def get_user_input
    gets.chomp.to_i
end


def create_contact
    puts "What is the contact's first name?"
    first_name = gets.chomp
    puts "What is the contact's last name?"
    last_name = gets.chomp
    puts "What is the contact's phone number?"
    phone_number = gets.chomp


    single_contact = {first_name: first_name, last_name: last_name, phone_number: phone_number}
    @contacts << single_contact
    puts "Contact with Name: #{first_name} #{last_name} has been added. \n\n"
end

def display_contacts
    puts "    Contacts\n--------------"
    @contacts.each_with_index { |item, index| print index + 1, ". #{item[:first_name]} #{item[:last_name]}, #{item[:phone_number]} \n"}
    puts "\n --- End of Contacts list --- \n\n"
end


def edit_contact
    display_contacts
    puts "Please select an number of the contact you want to edit."

    selection = get_user_input

    puts "What is the contact's first name?"
    first_name = gets.chomp
    puts "What is the contact's last name?"
    last_name = gets.chomp
    puts "What is the contact's phone number?"
    phone_number = gets.chomp



    @contacts[selection - 1][:first_name] = first_name
    @contacts[selection - 1][:last_name] = last_name
    @contacts[selection - 1][:phone_number] = phone_number

    puts "The contact's info has been updated. \n\n"
end

def delete_contact
    display_contacts
    puts "Please select an number of the contact you want to delete."

    selection = get_user_input

    @contacts.delete_at(selection - 1)
    puts "The contact has been deleted. \n\n"
end

def input_eval
    selection = get_user_input

    case selection
        when 1
            display_contacts
        when 2
            create_contact
        when 3
            edit_contact
        when 4
            delete_contact
        when 5
            puts "Goodbye"
            @continue = false
        else
            puts "Invalid input, try again."
    end   
end


while @continue
    display_menu
end
