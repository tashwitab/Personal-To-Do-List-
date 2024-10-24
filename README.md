# Personal To-Do List Manager in Bash

A simple command-line based to-do list manager written in Bash that allows users to manage tasks efficiently. This script provides basic functionality to add tasks, view pending tasks, mark tasks as done, and remove tasks from a to-do list stored in a text file.

## Features

- **View To-Do List**: Displays all tasks with their respective task numbers.
- **Add New Task**: Allows the user to add new tasks to the list.
- **Mark Task as Done**: Marks a task as completed by changing `[ ]` to `[X]`.
- **Remove Task**: Deletes a task from the list.
- **Simple File Storage**: Tasks are stored in a plain text file (`todo_list.txt`) in the user's home directory.

## How It Works

1. **View Tasks**:  
   The list of tasks is displayed with line numbers using `cat -n`. Each task is marked as either pending `[ ]` or done `[X]`.

2. **Add Tasks**:  
   New tasks can be added through a simple prompt, and they will appear at the bottom of the to-do list with a `[ ]` indicating that they are pending.

3. **Mark as Done**:  
   A task number is provided to mark a task as done, and the script replaces `[ ]` with `[X]` using the `sed` command.

4. **Remove Tasks**:  
   A task number is provided to remove a task from the list, and the corresponding line is deleted using `sed`.

## Prerequisites

- **Bash Shell**: The script is written in Bash, so you'll need a Unix-like system (Linux, macOS, WSL for Windows).
- No additional dependencies are required; the script utilizes built-in shell commands (`cat`, `sed`, `grep`, `touch`).


