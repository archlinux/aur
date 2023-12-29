echo "Initializing NVS..." &&
[ -z ${NVS_HOME} ] && export NVS_HOME=${HOME}/.nvs &&
. /usr/share/nvs/nvs.sh install &&
echo -e "
To enable NVS, restart your shell or source its init file.
For example, in bash run: \033[7m. ~/.bashrc\033[0m
"
