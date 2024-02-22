#!/bin/bash

#firstlly I will create function to add a new user
add_user() {
    read -p "please enter username: " username
    useradd $username
    echo "User $username added successfully."
}

#then I create function to modify an existing user
modify_user() {
    read -p "please enter username to modify: " username
    usermod -l $username $username
    echo "User $username modified successfully."
}
#Also
#create function to delete an existing user
delete_user() {
    read -p "please enter username to delete: " username
    userdel -r $username
    echo "User $username deleted successfully."
}
#Now
#create function to add a new group
add_group() {
    read -p "please enter group name: " groupname
    groupadd $groupname
    echo "Group $groupname added successfully."
}

# then create function to modify an existing group
modify_group() {
    read -p "please enter group name to modify: " groupname
    groupmod -n $groupname $groupname
    echo "Group $groupname modified successfully."
}

#create function to delete an existing group
delete_group() {
    read -p "please enter group name to delete: " groupname
    groupdel $groupname
    echo "Group $groupname deleted successfully."
}

#create function to add a user to a group
add_user_to_group() {
    read -p "please enter username: " username
    read -p "please enter group name: " groupname
    usermod -aG $groupname $username
    echo "User $username added to group $groupname successfully."
}

#create function to delete a user from a group
delete_user_from_group() {
    read -p "please enter username: " username
    read -p "please enter group name: " groupname
    deluser $username $groupname
    echo "User $username removed from group $groupname successfully."
}
#Last will make
# Main minue to selct what i need to do
while true; do
    echo "Select an option:"
    echo "1. Add User"
    echo "2. Modify User"
    echo "3. Delete User"
    echo "4. Add Group"
    echo "5. Modify Group"
    echo "6. Delete Group"
    echo "7. Add User to Group"
    echo "8. Delete User from Group"
    echo "9. Exit"

    read -p "please enter your choice: " choice

    case $choice in
        1)
            add_user
            ;;
        2)
            modify_user
            ;;
        3)
            delete_user
            ;;
        4)
            add_group
            ;;
        5)
            modify_group
            ;;
        6)
            delete_group
            ;;
        7)
            add_user_to_group
            ;;
        8)
            delete_user_from_group
            ;;
        9)
            echo "Exiting script."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a valid option."
            ;;
    esac
done
