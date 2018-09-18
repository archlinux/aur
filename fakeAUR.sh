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
    echo "Try -debug if something is wrong with the output"
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
                echo $processes
                echo "and now reduced"
                pac=$(echo $processes | grep -o -P "(?<=00:00:00).*(?=$USER)" | grep -o -P "(?<=00:00:00).*(?=00:00:00)")
                echo $pac
                one=$(echo $pac | cut -d' ' -f1)
                two=$(echo $pac | cut -d' ' -f2)
                pac=$one" "$two
                echo concat
                echo $pac
                echo concat end
                
               # if [[ $pac = *"00"* ]]; then
               #     delete=$(echo $pac | grep -oP "(?<=$USER\s)\w+")
               #     pac=$(echo $pac | grep -o -P '(?<=00:00:00).*(?=)')
               #     echo lol
               #     echo $pac
               #     echo rid off me
               #     echo $delete
               #     echo now
               #     kill -9 $delete
               # fi
               # echo $pac
            
                description=$(echo -ne '\n' | eval "${pac}" | grep "    ")
                name=$(echo ${pac} | grep -Eo "[^ ]+$")
                helper=$(echo ${pac} | grep -o '^\S*')
                echo ${PS1@P}$helper btwiusearch
                echo -ne '\n' | eval ${pac} | sed -e "s/$name/btwiusearch/" | sed -e "s/$description/A very important and easy to use package to show the world that you run the best distro/"
            ;;
            -btw )
                processes=$(> >(ps -f))
                pac=$(echo $processes | grep -o -P "(?<=00:00:00).*(?=$USER)" | grep -o -P "(?<=00:00:00).*(?=00:00:00)")
                one=$(echo $pac | cut -d' ' -f1)
                two=$(echo $pac | cut -d' ' -f2)
                pac=$one" "$two
            
                description=$(echo -ne '\n' | eval "${pac}" | grep "    ")
                name=$(echo ${pac} | grep -Eo "[^ ]+$")
                helper=$(echo ${pac} | grep -o '^\S*')
                echo ${PS1@P}$helper btwiusearch
                echo -ne '\n' | eval ${pac} | sed -e "s/$name/btwiusearch/" | sed -e "s/$description/A very important and easy to use package to show the world that you run the best distro/"
            ;;
            -nani )
                processes=$(> >(ps -f))
                pac=$(echo $processes | grep -o -P "(?<=00:00:00).*(?=$USER)" | grep -o -P "(?<=00:00:00).*(?=00:00:00)")
                one=$(echo $pac | cut -d' ' -f1)
                two=$(echo $pac | cut -d' ' -f2)
                pac=$one" "$two
            
                description=$(echo -ne '\n' | eval "${pac}" | grep "    ")
                name=$(echo ${pac} | grep -Eo "[^ ]+$")
                helper=$(echo ${pac} | grep -o '^\S*')
                echo ${PS1@P}$helper nani
                echo -ne '\n' | eval ${pac} | sed -e "s/$name/nani/" | sed -e "s/$description/now you can speak japanese/"
            ;;
            -grep)
                processes=$(> >(ps -f))
                pac=$(echo $processes | grep -o -P "(?<=00:00:00).*(?=$USER)" | grep -o -P "(?<=00:00:00).*(?=00:00:00)")
                one=$(echo $pac | cut -d' ' -f1)
                two=$(echo $pac | cut -d' ' -f2)
                pac=$one" "$two
            
                description=$(echo -ne '\n' | eval "${pac}" | grep "    ")
                echo $description
            ;;
            *)
                processes=$(> >(ps -f))
                pac=$(echo $processes | grep -o -P "(?<=00:00:00).*(?=$USER)" | grep -o -P "(?<=00:00:00).*(?=00:00:00)")
                one=$(echo $pac | cut -d' ' -f1)
                two=$(echo $pac | cut -d' ' -f2)
                pac=$one" "$two
            
                description=$(echo -ne '\n' | eval "${pac}" | grep "    ")
                name=$(echo ${pac} | grep -Eo "[^ ]+$")
                helper=$(echo ${pac} | grep -o '^\S*')
                echo ${PS1@P}$helper $1
                echo -ne '\n' | eval ${pac} | sed -e "s/$name/$1/" | sed -e "s/$description/$2/"
            ;;
        esac
    done
exit 0
