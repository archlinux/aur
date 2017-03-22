
# init module enviroment

if [[ `ps -hp $$ | awk '{print $5}'` = "bash" ]]; then
    source /usr/Modules/default/init/bash
elif [[ `ps -hp $$ | awk '{print $5}'` = "zsh" ]]; then
   source /usr/Modules/default/init/zsh
fi


