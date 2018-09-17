#!/bin/bash -i
#Developer: schrmh (schreibemirhalt@gmail.com) / derberg#7221 from Linux Gaming Discord
#Git-Repo: 
function show_help () {
    echo "fakeAUR"
    echo "You need to use the option -echo and provide AUR helper (e.g. yay) + old name package name, new package name and new description:"
    echo "fakeAUR -echo \"yay fakeAUR\" nani \"now you can speak japanese\""
    echo ""
    echo "use -btw for a btwiusearch message and -nani for that nani message."
    echo "-grep will grep the original description of the piped package"
    echo "TODO: 1). switch between core/community/aur or custom with colour. Also version, size, orphanded, etc."
    echo "2) Manipulate multiple packages at once and list them just like a package helper would"
    echo "3) Copy a screnshoot to clipboard"
    echo "4) implement piping: yay fakeAUR | fakeAUR nani \"now you can speak japanese\""
    echo "5) Fix formatted output for trizen.."
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
            -btw )
                description=$(echo -ne '\n' | eval "$2" | grep "    ")
                name=$(echo $2 | grep -Eo "[^ ]+$")
                helper=$(echo $2 | grep -o '^\S*')
                echo ${PS1@P}$helper btwiusearch
                echo -ne '\n' | eval $2 | sed -e "s/$name/btwiusearch/" | sed -e "s/$description/A very important and easy to use package to show the world that you run the best distro/"
            ;;
            -nani )
                description=$(echo -ne '\n' | eval "$2" | grep "    ")
                name=$(echo $2 | grep -Eo "[^ ]+$")
                helper=$(echo $2 | grep -o '^\S*')
                echo ${PS1@P}$helper nani
                echo -ne '\n' | eval $2 | sed -e "s/$name/nani/" | sed -e "s/$description/now you can speak japanese/"
            ;;
            -echo )
                description=$(echo -ne '\n' | eval "$2" | grep "    ")
                name=$(echo $2 | grep -Eo "[^ ]+$")
                helper=$(echo $2 | grep -o '^\S*')
                echo ${PS1@P}$helper $3
                echo -ne '\n' | eval $2 | sed -e "s/$name/$3/" | sed -e "s/$description/$4/"
            ;;
            -grep)
            description=$(echo -ne '\n' | eval "$2" | grep "    ")
            echo $description
            ;;
        esac
    done
exit 0
