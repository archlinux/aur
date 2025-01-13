#!/usr/bin/env bash

PINK="\e[38;5;219m"
LIGHT_PINK="\e[38;5;225m"
MAGENTA="\e[38;5;200m"
CYAN="\e[38;5;159m"
RESET="\e[0m"

printHeader() {
    clear
    echo -e "${PINK}============================================${RESET}"
    echo -e "${PINK}${RESET}"
    echo -e "${PINK}    ████████╗ ██████╗ ██████╗  ██████╗ ${RESET}"
    echo -e "${PINK}    ╚══██╔══╝██╔═══██╗██╔══██╗██╔═══██╗${RESET}"
    echo -e "${PINK}       ██║   ██║   ██║██║  ██║██║   ██║${RESET}"
    echo -e "${PINK}       ██║   ██║   ██║██║  ██║██║   ██║${RESET}"
    echo -e "${PINK}       ██║   ╚██████╔╝██████╔╝╚██████╔╝${RESET}"
    echo -e "${PINK}       ╚═╝    ╚═════╝ ╚═════╝  ╚═════╝ ${RESET}"
    echo -e "${PINK}                                   ${RESET}"
    echo -e "${PINK}============================================${RESET}"
    echo -e "${LIGHT_PINK}             TODO CLI v1.0${RESET}"
    echo -e "${LIGHT_PINK}        Manage your tasks effortlessly!${RESET}"
    echo -e "${LIGHT_PINK}"
    echo -e "${LIGHT_PINK}       - Add, View, and Remove Tasks${RESET}"
    echo -e "${LIGHT_PINK}       - Local storage for long-running tasks${RESET}"
    echo -e "${LIGHT_PINK}       - Created by: Harish Rusum${RESET}"
    echo -e "${LIGHT_PINK}"
    echo -e "${LIGHT_PINK}       Instructions : ${RESET}"
    echo -e "${LIGHT_PINK}"
    echo -e "${LIGHT_PINK}       - Use the arrow keys to navigate${RESET}"
    echo -e "${LIGHT_PINK}       - Press Enter to select an option${RESET}"
    echo -e "${LIGHT_PINK}       - Press Ctrl+C to return to the menu${RESET}"
    echo -e "${LIGHT_PINK}       - Press Ctrl+D to exit${RESET}"
    echo -e "${LIGHT_PINK}============================================${RESET}"
    echo 
}

TODO_DIR="$HOME/.local/todo"
TODO_FILE="$TODO_DIR/todo.txt"
mkdir -p "$TODO_DIR"

remove_task() {
    if [[ -f $TODO_FILE && -s $TODO_FILE ]]; then
        mapfile -t TASKS < "$TODO_FILE"
        SELECTED=$(printf "%s\n" "${TASKS[@]}" | gum choose)
        if [[ -n $SELECTED ]]; then
            sed -i "/^$(echo "$SELECTED" | sed 's/[&/\]/\\&/g')$/d" "$TODO_FILE"
            echo -e "${PINK}[✔] Task removed successfully!${RESET}"
        else
            echo -e "${MAGENTA}[⚠] No task selected!${RESET}"
        fi
    else
        echo -e "${CYAN}[⚠] No tasks available to remove!${RESET}"
    fi
}

add_task() {
    echo -e "${CYAN}Enter a new task (leave blank to cancel):${RESET}"
    TASK=$(gum input --cursor.foreground="#ff87d7" )
    if [[ -n $TASK ]]; then
        echo "$TASK" >> "$TODO_FILE"
        echo -e "${PINK}[✔] Task added successfully!${RESET}"
    else
        echo -e "${MAGENTA}[⚠] No task added!${RESET}"
    fi
}

view_tasks() {
    echo -e "${CYAN}Task List:${RESET}"
    if [[ -f $TODO_FILE && -s $TODO_FILE ]]; then
        TASKS=$(cat "$TODO_FILE")
        gum style --border=double --padding="1 2" --margin="1 0" --foreground=white "$TASKS"
    else
        echo -e "${CYAN}[⚠] No tasks available!${RESET}"
    fi
}

exit_confirmation() {
    gum confirm "Return to the menu?" && return 0 || exit 0
}

while true; do
    printHeader
    ACTION=$(gum choose "[+] Add Task" "[>] View Tasks" "[x] Remove Task" "[Q] Quit")

    case $ACTION in
        "[+] Add Task")
            add_task
            ;;
        "[>] View Tasks")
            view_tasks
            ;;
        "[x] Remove Task")
            remove_task
            ;;
        "[Q] Quit")
            echo -e "${CYAN}[INFO] Goodbye! Happy tasking!${RESET}"
            exit 0
            ;;
        *)
            echo -e "${CYAN}[ERROR] Invalid option, exiting.${RESET}"
            exit 1
            ;;
    esac

    echo
    exit_confirmation
done
