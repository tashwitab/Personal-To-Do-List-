#!/bin/bash

USER_DATA_FILE="users.txt"  # File to store user credentials
CURRENT_USER=""

# Initialize the user data file if it doesn't exist
if [[ ! -f $USER_DATA_FILE ]]; then
    touch "$USER_DATA_FILE"
fi

# Function to hash passwords for basic security (uses SHA-256)
hash_password() {
    echo -n "$1" | sha256sum | awk '{print $1}'
}

# Function to register a new user
register_user() {
    echo "Enter a username: "
    read username

    # Check if the username already exists
    if grep -q "^$username|" "$USER_DATA_FILE"; then
        echo "Error: Username already exists! Please try logging in."
        return
    fi

    echo "Enter a password: "
    read -s password
    echo "Confirm your password: "
    read -s password_confirm

    if [[ "$password" != "$password_confirm" ]]; then
        echo "Error: Passwords do not match!"
        return
    fi

    hashed_password=$(hash_password "$password")
    echo "$username|$hashed_password" >> "$USER_DATA_FILE"
    touch "todo_${username}.txt"  # Create a task file for the user
    echo "Registration successful! You can now log in."
}

# Function to log in an existing user
login_user() {
    echo "Enter your username: "
    read username

    # Check if the username exists
    if ! grep -q "^$username|" "$USER_DATA_FILE"; then
        echo "Error: Username not found! Please register first."
        return 1
    fi

    echo "Enter your password: "
    read -s password

    hashed_password=$(hash_password "$password")
    stored_password=$(grep "^$username|" "$USER_DATA_FILE" | cut -d "|" -f2)

    if [[ "$hashed_password" == "$stored_password" ]]; then
        echo "Login successful!"
        CURRENT_USER="$username"
        TODO_FILE="todo_${username}.txt"
        return 0
    else
        echo "Error: Incorrect password!"
        return 1
    fi
}

# Display the main menu
show_menu() {
    echo "----------------------------------------"
    echo "          Personal To-Do List           "
    echo "        Logged in as: $CURRENT_USER     "
    echo "----------------------------------------"
    echo "1. Add Task"
    echo "2. View Tasks"
    echo "3. Delete Task"
    echo "4. Mark Task as Done"
    echo "5. Filter Tasks by Category"
    echo "6. Logout"
    echo "----------------------------------------"
}

# Function to add a task
add_task() {
    echo "Enter Task Description: "
    read description
    echo "Enter Priority (High/Medium/Low): "
    read priority
    echo "Enter Deadline (YYYY-MM-DD): "
    read deadline
    echo "Enter Category (Work, Personal, etc.): "
    read category
    echo "Task Added!"
    echo "TODO|$description|$priority|$deadline|$category" >> "$TODO_FILE"
}

# Function to view tasks
view_tasks() {
    echo "----------------------------------------"
    echo "              Your Tasks                "
    echo "----------------------------------------"
    printf "%-5s | %-30s | %-8s | %-10s | %-10s\n" "ID" "Description" "Priority" "Deadline" "Category"
    echo "----------------------------------------------------------------------------"
    awk -F "|" '{printf "%-5d | %-30s | %-8s | %-10s | %-10s\n", NR, $2, $3, $4, $5}' "$TODO_FILE"
}

# Function to delete a task
delete_task() {
    view_tasks
    echo "Enter Task ID to Delete: "
    read task_id
    sed -i "${task_id}d" "$TODO_FILE"
    echo "Task Deleted!"
}

# Function to mark a task as done
mark_done() {
    view_tasks
    echo "Enter Task ID to Mark as Done: "
    read task_id
    sed -i "${task_id}s/^TODO/DONE/" "$TODO_FILE"
    echo "Task Marked as Done!"
}

# Function to filter tasks by category
filter_tasks_by_category() {
    echo "Enter Category to Filter (Work, Personal, etc.): "
    read category
    echo "----------------------------------------"
    echo "         Tasks in Category: $category          "
    echo "----------------------------------------"
    printf "%-5s | %-30s | %-8s | %-10s | %-10s\n" "ID" "Description" "Priority" "Deadline" "Category"
    echo "----------------------------------------------------------------------------"
    awk -F "|" -v cat="$category" '$5 == cat {printf "%-5d | %-30s | %-8s | %-10s | %-10s\n", NR, $2, $3, $4, $5}' "$TODO_FILE"
}

# Logout function
logout_user() {
    echo "Logging out..."
    CURRENT_USER=""
    TODO_FILE=""
}

# Main program loop
while true; do
    if [[ -z "$CURRENT_USER" ]]; then
        echo "----------------------------------------"
        echo "         Welcome to To-Do List          "
        echo "----------------------------------------"
        echo "1. Register"
        echo "2. Login"
        echo "3. Exit"
        echo "----------------------------------------"
        echo "Enter your choice: "
        read choice

        case $choice in
            1) register_user ;;
            2)
                login_user
                if [[ $? -eq 0 ]]; then
                    TODO_FILE="todo_${CURRENT_USER}.txt"
                fi
                ;;
            3) echo "Goodbye!"; exit 0 ;;
            *) echo "Invalid Choice! Please try again." ;;
        esac
    else
        show_menu
        echo "Enter your choice: "
        read choice

        case $choice in
            1) add_task ;;
            2) view_tasks ;;
            3) delete_task ;;
            4) mark_done ;;
            5) filter_tasks_by_category ;;
            6) logout_user ;;
            *) echo "Invalid Choice! Please try again." ;;
        esac
        echo "Press Enter to continue..."
        read
    fi
done


