#!/bin/bash



if [[ -z $1 ]]; then
    read -p "Enter project name : " projectName
else 
    projectName=$1
fi

lib="vanila"

PS3="What css freamwork you want (vanila for none) : "

items=("vanila" "tailwind" "bootstrap")

select item in "${items[@]}" Quit
do
    case $REPLY in
        1) echo "Project created by vanila css";lib="vanila";break;;
        2) echo "Project created by tailwind";lib="tailwind";break;;
        3) echo "Project created by bootstrap";lib="bootstrap";break;;
        $((${#items[@]}+1))) echo "We're done!"; break;;
        *) echo "Ooops - unknown choice $REPLY";;
    esac
done



mkdir $projectName
cd $projectName

mkdir "assets";
mkdir "assets/images";
mkdir "assets/icons";
mkdir "assets/css"
mkdir "assets/js"

touch "index.html"
touch "assets/css/style.css";
touch "assets/js/script.js"

cd ..

if [ $lib == "vanila" ]; then
              cat /usr/share/webFinit/vanila.txt >> $projectName/index.html

elif [ $lib == "tailwind" ]; then
            cat /usr/share/webFinit/tailwind.txt >> $projectName/index.html

elif [ $lib == "bootstrap" ]; then
            cat /usr/share/webFinit/bootstrap.txt >> $projectName/index.html

else
          cat /usr/share/webFinit/vanila.txt >> $projectName/index.html

fi


echo "Project $projectName Created by following Scoffilding "
tree $projectName
