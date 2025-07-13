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
    echo 'ohshit: r u sure u want to delete? (y/n)'
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
        cat "$1"
        sleep 1
    done
}

dl() {
	load
	sed '$d' "$file" > tmp && mv tmp "$file"
}

help() {
    echo "welcome to M-Write! this is a lightweight quick text editor i made as a little joke."
    echo "commands:"
    echo ""
    echo "m-define: defines a file path to save to."
    echo "usage: m-define '/path/to/your/file'"
    echo ""
    echo "m-deldef: deletes the existing file definition."
    echo ""
    echo "m-checkdef: echoes the existing file definition."
    echo ""
    echo "m-add: adds text to the file. creates the file if it doesnt exist."
    echo "usage: m-add 'hello world!'"
    echo ""
    echo "m-check: outputs the file's contents."
    echo "" 
    echo "m-dl: deletes the last line."
    echo "m-delfile: deletes the entire file."
    echo ""
    echo "m-watch: live outputs the file. refreshes every second. use in another shell window."
    echo "usage: m-watch '/path/to/your/file'"
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
