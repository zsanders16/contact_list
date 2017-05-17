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

    single_contact = [first_name, last_name, phone_number]
    @contacts << single_contact
    puts "Contact with Name: #{first_name} #{last_name} has been added. \n\n"
end

def display_contacts
    puts "    Contacts\n--------------"
    @contacts.each_index { |x| print x + 1, ". #{@contacts[x][0]} #{@contacts[x][1]}, #{@contacts[x][2]} \n"}
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

    single_contact = [first_name, last_name, phone_number]
    @contacts[selection - 1] = single_contact
    puts "The contact's name has been updated. \n\n"
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
