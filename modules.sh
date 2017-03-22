
# init module enviroment

if [[ `ps -hp $$ | grep 'bash'` ]]; then
    source /usr/Modules/default/init/bash
elif [[ `ps -hp $$ | grep 'zsh'` ]]; then
   source /usr/Modules/default/init/zsh
fi


