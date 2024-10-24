#!/bin/bash

# File to store to-do list
TODO_FILE="$HOME/todo_list.txt"

# Check if the file exists, if not create it
if [ ! -f "$TODO_FILE" ]; then
  touch "$TODO_FILE"
fi

# Function to show the to-do list
show_tasks() {
  if [ ! -s "$TODO_FILE" ]; then
    echo "Your to-do list is empty."
  else
    echo "Your to-do list:"
    cat -n "$TODO_FILE"
  fi
}

# Function to add a new task
add_task() {
  echo "$1 [ ]" >> "$TODO_FILE"
  echo "Task '$1' added to your to-do list."
}

# Function to mark a task as done
mark_done() {
  TASK_NUM=$1
  if sed -n "${TASK_NUM}p" "$TODO_FILE" | grep -q "\[X\]"; then
    echo "Task is already marked as done."
  else
    sed -i "${TASK_NUM}s/\[ \]/\[X\]/" "$TODO_FILE"
    echo "Task #$TASK_NUM marked as done."
  fi
}

# Function to remove a task
remove_task() {
  TASK_NUM=$1
  sed -i "${TASK_NUM}d" "$TODO_FILE"
  echo "Task #$TASK_NUM removed from your to-do list."
}

# Main menu
while true; do
  echo -e "\n===== To-Do List Manager ====="
  echo "1. View To-Do List"
  echo "2. Add New Task"
  echo "3. Mark Task as Done"
  echo "4. Remove Task"
  echo "5. Exit"
  echo -n "Choose an option (1-5): "
  read -r option

  case $option in
    1)
      show_tasks
      ;;
    2)
      echo -n "Enter the new task: "
      read -r task
      add_task "$task"
      ;;
    3)
      echo -n "Enter the task number to mark as done: "
      read -r task_num
      mark_done "$task_num"
      ;;
    4)
      echo -n "Enter the task number to remove: "
      read -r task_num
      remove_task "$task_num"
      ;;
    5)
      echo "Exiting the To-Do List Manager."
      break
      ;;
    *)
      echo "Invalid option. Please choose a valid number (1-5)."
      ;;
  esac
done
