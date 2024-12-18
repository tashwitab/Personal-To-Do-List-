# Personal To-Do List Manager in Bash

A simple command-line-based to-do list manager written in Bash that allows users to manage tasks efficiently. This script provides basic functionality to add tasks, view pending tasks, mark tasks as done, and remove tasks from a to-do list stored in a text file.

## Features

### Features of the Code: **Personal To-Do List with User Login**

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
  - Users can log out, returning to the login/registration screen.

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

1. **View Tasks**:  
   The list of tasks is displayed with line numbers using `cat -n.` Each task is marked as either pending `[ ]` or done `[X]`.

2. **Add Tasks**:  
   New tasks can be added through a simple prompt, and they will appear at the bottom of the to-do list with a `[ ]` indicating that they are pending.

3. **Mark as Done**:  
   A task number is provided to mark a task as done, and the script replaces `[ ]` with `[X]` using the `sed` command.

4. **Remove Tasks**:  
   A task number is provided to remove a task from the list, and the corresponding line is deleted using `sed`.

## Prerequisites

- **Bash Shell**: The script is written in Bash, so you'll need a Unix-like system (Linux, macOS, WSL for Windows).
- No additional dependencies are required; the script utilizes built-in shell commands (`cat`, `sed`, `grep`, `touch`).


