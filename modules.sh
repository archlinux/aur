
# init module enviroment

if [[ -n $BASH_VERSION ]]; then
    source /usr/Modules/default/init/bash
elif [[ -n $ZSH_VERSION  ]]; then
   source /usr/Modules/default/init/zsh
fi


