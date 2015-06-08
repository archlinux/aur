if [ -z "$XDG_CONFIG_HOME" ]; then
    _config_dir="$HOME/.config/hydraslayer"
else
    _config_dir="$XDG_CONFIG_HOME/hydraslayer"
fi   
 
mkdir -p "$_config_dir" || return 1

cd /usr/share/hydraslayer 
./hydraslayer -f $_config_dir/hydra.sav -t $_config_dir/hydralog.txt -g /usr/share/hydraslayer/hydrascores.sav $*
