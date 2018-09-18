#!/bin/bash -i
#Developer: schrmh (schreibemirhalt@gmail.com) / derberg#7221 from Linux Gaming Discord
#Version: 2 - now with impossible piping
function show_help () {
    echo "fakeAUR 2 - now with impossible piping"
    echo "You pipe with your package helper (e.g yay) and provide a new package name and a new description:"
    echo "yay <package> | fakeAUR nani \"now you can speak japanese\""
    echo ""
    echo "use -btw without further parameters for a btwiusearch message or -nani for that nani message."
    echo "-grep will grep the original description of the piped package"
    echo "TODO: 1). switch between core/community/aur or custom with colour. Also version, size, orphanded, etc."
    echo "2) Manipulate multiple packages at once and list them just like a package helper would"
    echo "3) Copy a screnshoot to clipboard"
    echo "4) Fix formatted output for trizen.."
    echo "5) A config file that allows custom shortcuts that are like -btw or -nani"
}
if [ $# -eq 0 ] 
then
    show_help
    exit 1
fi

for i in "$@"
    do 
        case $i in
            -h | --h | --help )
                show_help
                exit 1
            ;;
            -debug )
                processes=$(> >(ps -f))
                pac=$(echo $processes | grep -o -P '(?<=CM).*(?=fakeAUR)' | grep -o -P '(?<=D).*(?=fakeAUR)' | grep -o -P "(?<=00:00:00).*(?=$USER)")
                echo $pac
                if [[ $pac = *"00"* ]]; then
                    delete=$(echo $pac | grep -oP "(?<=$USER\s)\w+")
                    pac=$(echo $pac | grep -o -P '(?<=00:00:00).*(?=)')
                    echo lol
                    echo $pac
                    echo rid off me
                    echo $delete
                    echo now
                    kill -9 $delete
                fi
                echo $pac
            
                description=$(echo -ne '\n' | eval "${pac:1}" | grep "    ")
                name=$(echo ${pac:1} | grep -Eo "[^ ]+$")
                helper=$(echo ${pac:1} | grep -o '^\S*')
                echo ${PS1@P}$helper $1
                echo -ne '\n' | eval ${pac:1} | sed -e "s/$name/$1/" | sed -e "s/$description/$2/"
            ;;
            -btw )
                processes=$(> >(ps -f))
                pac=$(echo $processes | grep -o -P '(?<=CM).*(?=fakeAUR)' | grep -o -P '(?<=D).*(?=fakeAUR)' | grep -o -P "(?<=00:00:00).*(?=$USER)")
                if [[ $pac = *"00"* ]]; then
                    delete=$(echo $pac | grep -oP "(?<=$USER\s)\w+")
                    pac=$(echo $pac | grep -o -P '(?<=00:00:00).*(?=)')
                    kill -9 $delete
                fi
            
                description=$(echo -ne '\n' | eval "${pac:1}" | grep "    ")
                name=$(echo ${pac:1} | grep -Eo "[^ ]+$")
                helper=$(echo ${pac:1} | grep -o '^\S*')
                echo ${PS1@P}$helper btwiusearch
                echo -ne '\n' | eval ${pac:1} | sed -e "s/$name/btwiusearch/" | sed -e "s/$description/A very important and easy to use package to show the world that you run the best distro/"
            ;;
            -nani )
                processes=$(> >(ps -f))
                pac=$(echo $processes | grep -o -P '(?<=CM).*(?=fakeAUR)' | grep -o -P '(?<=D).*(?=fakeAUR)' | grep -o -P "(?<=00:00:00).*(?=$USER)")
                if [[ $pac = *"00"* ]]; then
                    delete=$(echo $pac | grep -oP "(?<=$USER\s)\w+")
                    pac=$(echo $pac | grep -o -P '(?<=00:00:00).*(?=)')
                    kill -9 $delete
                fi
            
                description=$(echo -ne '\n' | eval "${pac:1}" | grep "    ")
                name=$(echo ${pac:1} | grep -Eo "[^ ]+$")
                helper=$(echo ${pac:1} | grep -o '^\S*')
                echo ${PS1@P}$helper nani
                echo -ne '\n' | eval ${pac:1} | sed -e "s/$name/nani/" | sed -e "s/$description/now you can speak japanese/"
            ;;
            -grep)
                processes=$(> >(ps -f))
                pac=$(echo $processes | grep -o -P '(?<=CM).*(?=fakeAUR)' | grep -o -P '(?<=D).*(?=fakeAUR)' | grep -o -P "(?<=00:00:00).*(?=$USER)")
                if [[ $pac = *"00"* ]]; then
                    delete=$(echo $pac | grep -oP "(?<=$USER\s)\w+")
                    pac=$(echo $pac | grep -o -P '(?<=00:00:00).*(?=)')
                    kill -9 $delete
                fi
            
                description=$(echo -ne '\n' | eval "${pac:1}" | grep "    ")
                echo $description
            ;;
            *)
                processes=$(> >(ps -f))
                pac=$(echo $processes | grep -o -P '(?<=CM).*(?=fakeAUR)' | grep -o -P '(?<=D).*(?=fakeAUR)' | grep -o -P "(?<=00:00:00).*(?=$USER)")
                if [[ $pac = *"00"* ]]; then
                    delete=$(echo $pac | grep -oP "(?<=$USER\s)\w+")
                    pac=$(echo $pac | grep -o -P '(?<=00:00:00).*(?=)')
                    kill -9 $delete
                fi
            
                description=$(echo -ne '\n' | eval "${pac:1}" | grep "    ")
                name=$(echo ${pac:1} | grep -Eo "[^ ]+$")
                helper=$(echo ${pac:1} | grep -o '^\S*')
                echo ${PS1@P}$helper $1
                echo -ne '\n' | eval ${pac:1} | sed -e "s/$name/$1/" | sed -e "s/$description/$2/"
            ;;
        esac
    done
exit 0
