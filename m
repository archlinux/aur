#!/bin/bash

add() {
    load
    echo "$*" >> "$file" && echo "m: added!"
}

check() {
    load
    cat "$file"
}

delfile() {
    load
    echo 'm: are you sure you want to delete? (y/n)'
    read answer
    if [[ "$answer" == "y" ]]; then
        rm "$file" && echo "m: deleted!"
    elif [[ "$answer" == "n" ]]; then
        echo "m: deletn't!"
    fi
}

def() {
    echo "$1" > /tmp/m_file
}

deldef() {
    rm /tmp/m_file
}

watch() {
    trap 'tput cnorm; clear; exit' INT
    tput civis
    while true; do
        clear
        cat -n "$1"
        sleep 1
    done
}

dl() {
	load
	sed '$d' "$file" > tmp && mv tmp "$file"
}

dsl() {
	load
	sed -i "${1}d" "$file"
}

rl() {
	load
	sed -i "${1}s|.*|${2}|" "$file"
}

addaft() {
	load 
	sed -i "${1}a $2" "$file"
}

help() {
    echo "welcome to M! this is a lightweight and easy to use text editor."
    echo "commands:"
    echo ""
    echo "def: defines a file path to save to."
    echo "usage: m-define '/path/to/your/file'"
    echo ""
    echo "deldef: deletes the existing file definition."
    echo ""
    echo "checkdef: echoes the existing file definition."
    echo ""
    echo "add: adds text to the file. creates the file if it doesnt exist."
    echo "usage: m add 'hello world!'"
    echo ""
    echo "addaft: add a line after a selected line."
    echo "usage: m addaft 4 'hello world!'"
    echo ""
    echo "rl: replace the text of the selected line."
    echo "usage: m rl 4 'hello world!'"
    echo ""
    echo "check: outputs the file's contents."
    echo "" 
    echo "dl: deletes the last line."
    echo ""
    echo "dsl: deletes the selected line."
    echo "usage: m dsl 4"
    echo ""
    echo "delfile: deletes the entire file."
    echo ""
    echo "watch: live outputs the file. refreshes every second. use in another shell window."
    echo "usage: m watch '/path/to/your/file'"
    echo ""
}

checkdef() {
	load
	echo "$file"
}

load() {
	file=$(</tmp/m_file)
}

# execute the passed function
"$@"
