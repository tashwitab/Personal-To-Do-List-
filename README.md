# Personal To-Do List Manager in Bash

This project is a **simple yet powerful command-line To-Do List application** written in Bash. It allows users to securely manage their personal tasks with individual accounts, ensuring data privacy and organization. Designed for users who prefer a lightweight, terminal-based task manager, the application is intuitive, portable, and stores data persistently.

With features like user registration, secure login, and task categorization, this project provides an easy way to manage daily responsibilities. Each user has their own private to-do list, offering task separation and ensuring that tasks are only accessible after authentication. 

The **core features** include task management (add, view, delete, and mark tasks as done), task filtering by category, and password-protected user accounts. Passwords are hashed using the **SHA-256 algorithm** for security, while individual task files (`todo_<username>.txt`) ensure data segregation.

This project is ideal for learning and understanding basic concepts of:
- User authentication and data security.
- File handling and persistent storage in Bash.
- Building interactive command-line applications.

## Features

- **User Registration**:
  - New users can register with a unique username and password.
  - Passwords are hashed using **SHA-256** for basic security.

- **User Login**:
  - Existing users can log in with their credentials.
  - Only authenticated users can access their personal to-do lists.

- **Per-User To-Do Files**:
  - Each user has their own task file named `todo_<username>.txt`.
  - Ensures data separation and privacy for each user.

- **Add Tasks**:
  - Users can add tasks with details like:
    - Task description.
    - Priority (High/Medium/Low).
    - Deadline (YYYY-MM-DD format).
    - Category (e.g., Work, Personal).

- **View Tasks**:
  - Displays all tasks in a tabular format with:
    - Task ID.
    - Description.
    - Priority.
    - Deadline.
    - Category.

- **Delete Tasks**:
  - Allows users to remove tasks by selecting their Task ID.

- **Mark Tasks as Done**:
  - Enables marking tasks as completed, changing their status from `TODO` to `DONE`.

- **Filter Tasks by Category**:
  - Users can view tasks filtered by specific categories (e.g., Work, Personal).

- **Logout Functionality**:
  - Users can log out and return to the login/registration screen.

- **Persistent Storage**:
  - User credentials are stored in a `users.txt` file.
  - Tasks for each user are stored in separate files (`todo_<username>.txt`), ensuring persistence.

- **Error Handling**:
  - Prevents duplicate usernames during registration.
  - Validate password match during registration.
  - Provides feedback for incorrect login attempts (e.g., incorrect password or non-existent username).

- **Interactive Menus**:
  - User-friendly, text-based menus for navigation and task management.
  - Clear prompts for each action.

- **Portable**:
  - Fully implemented in Bash, making it lightweight and compatible with most Unix-like systems.



## How It Works
### How It Works:

1. **User Registration**:  
   - New users register by providing a unique username and password.  
   - Passwords are securely hashed using SHA-256 and stored in a `users.txt` file.  
   - A personal task file (`todo_<username>.txt`) is created for each user.

2. **User Login**:  
   - Users log in with their credentials.  
   - Only authenticated users can access their personal tasks.

3. **Task Management**:  
   - After login, users can:
     - Add tasks with details (description, priority, deadline, category).
     - View tasks in a tabular format.
     - Delete tasks by their ID.
     - Mark tasks as done (updates status from `TODO` to `DONE`).
     - Filter tasks by category (e.g., Work, Personal).

4. **Logout**:  
   - Users can log out and return to the login/registration menu.  

5. **Data Separation**:  
   - Each user’s tasks are stored in a unique file (`todo_<username>.txt`), ensuring privacy and data integrity.

6. **Persistent Storage**:  
   - User credentials and tasks are saved to disk, allowing access even after the app is closed.  

This system is entirely text-based and operates via a simple, intuitive menu-driven interface.

## Prerequisites

- **Bash Shell**: The script is written in Bash, so you'll need a Unix-like system (Linux, macOS, WSL for Windows).
- No additional dependencies are required; the script utilizes built-in shell commands (`cat`, `sed`, `grep`, `touch`).


