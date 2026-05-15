#!/bin/bash

dir=$(dirname "$(readlink -f "$0")")
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -h|-H|-help)
            echo "Usage: spinner-wheel <options>"
            echo "Usage: spinner-wheel <name>   to sping the wheel"
            echo "Available wheels: ${text_files[@]}"
            echo "Options:"
            echo "      -h/H/help       bring up this screen"
            echo "      -n <name>       create a wheel"
            echo "      -l|-L       list wheels"
            echo "      -N/e/E <name>       create/edit a wheel using nano"
            ;;
        -n)
            if [ -n "$2" ]; then

                touch "$dir/$2.txt"
                IFS="," read -a values -p "Enter the elements of wheel seperated by a comma: "
                for n in ${values[*]};
                do
                    echo "$n"
                done
                readarray -t text_files < <(ls | grep ".txt" | sed 's/[".txt"]//g') # Reads direcotry for txt files
                echo "Available wheels: ${text_files[@]}"
                exit
            else
                echo "When creating a new wheel, pass a name: spinner-wheel -n <name>"
                exit
            fi
            ;;

        -N|-e|-E)
            if [ -n "$2" ]; then
                touch "$dir/$2.txt"
                nano "$dir/$2.txt"
                readarray -t text_files < <(ls | grep ".txt" | sed 's/[".txt"]//g') # Reads direcotry for txt files
                echo "Available wheels: ${text_files[@]}"
                exit
            else
                echo "When creating a new wheel, pass a name: spinner-wheel -N <name>"
                exit
            fi
            ;;
        -l|-L)
            readarray -t text_files < <(ls | grep ".txt" | sed 's/[".txt"]//g') # Reads direcotry for txt files
            for item in ${text_files[@]}; do 
                echo $item; 
            done
            exit
        ;;
        -*)
            # Catch-all for any other flag starting with a dash
            echo "Error: Unknown flag: $1"
            exit
            ;;

        *)
            # If it doesn't start with a dash, treat it as our main required argument
            MAIN_ARG="$1"
            shift # Move past the argument
            ;;
            
    esac
done

readarray -t text_files < <(ls | grep ".txt" | sed 's/[".txt"]//g') # Reads direcotry for txt files
if [ -n "$MAIN_ARG" ]; then
    if [[ " ${text_files[*]} " =~ " $MAIN_ARG " ]]; then
    # whatever you want to do when array contains value
        width=70

        words=()
        lengths=()
        start_indexes=()
        start_index=0
        skipped_chars=("#")
        while IFS= read -r line || [[ -n "$line" ]]; do
            words+=("$line")
            lengths+=(${#line})
            start_indexes+=($start_index)
            ((start_index+=((${#line}+1))))
        done < "${MAIN_ARG}.txt"
        str_words="${words[@]} "
        while [ ${#str_words} -lt 70 ]; do
            str_words+=$str_words
        done
        random_index=$((RANDOM % ${#words[@]}))
        # echo $((RANDOM % (max - min + 1) + min))
        loops=$((((RANDOM % (5-2+1)+2))*${#str_words}))
        min=${start_indexes[random_index]}
        max=$((${start_indexes[random_index]}+${lengths[random_index]}-1))
        n_of_word=$((RANDOM % (max-min+1)+min))
        echo "                                  V"
        echo
        x=$((${loops}+${n_of_word}))
        half_x=$(($x/2))
        for ((n = 1; n <= x; n++)); do
            echo -e "\e[1A\e[K${str_words: -33}${str_words:0:37}"
            str_words="${str_words:1}${str_words:0:1}"
            if [ $n -lt $half_x ]; then
                speed=$(awk "BEGIN {print 1 / $n}")
            else
                sum=$(($x-$n+1))
                speed=$(awk "BEGIN {print 1 / $sum}")
            fi
            sleep $speed
        done

    else
        echo "File '$MAIN_ARG' does not exist"
        exit
    fi
else
    echo "Usage: spinner-wheel <options>"
    echo "Usage: spinner-wheel <name>   to sping the wheel"
    echo "Available wheels: ${text_files[@]}"
    echo "Options:"
    echo "      -h/H/help       bring up this screen"
    echo "      -n <name>       create a wheel"
    echo "      -l|-L       list wheels"
    echo "      -N/e/E <name>       create/edit a wheel using nano"
fi

exit