#!/usr/bin/env bash

#  _  __                  _         __  __
# | |/ /__ _ _ _ __ _ ___| |_____  |  \/  |_  _ __ _ ___ _ _
# | ' </ _` | '_/ _` / _ \ / / -_) | |\/| | || / _` / -_) ' \
# |_|\_\__,_|_| \__,_\___/_\_\___| |_|  |_|\_,_\__, \___|_||_|
#                                              |___/

# This script creates the database and do some checks to make
# Karaoke Mugen App working.
# From AUR package karaokemugen-git

check_postgres() {
    sudo -u postgres -g postgres pg_ctl status -D /var/lib/postgres/data &> /dev/null
    if [ $? -eq 4 ]; then
        echo -e "${_COL_YELLOW_}Postgres is not initialized, initializing..."
        sudo -H -u postgres -g postgres initdb -D /var/lib/postgres/data
        check_postgres
    elif [ $? -eq 3 ]; then
        echo -e "${_COL_YELLOW_}Postgres is not running, starting..."
        sudo systemctl restart postgresql
        check_postgres
    else
        echo -e "${_COL_GREEN_}Postgres seems OK."
    fi
}

check_mugen() {
    if [ -f "/opt/karaokemugen/karaokemugen" ]; then
        echo -e "${_COL_GREEN_}Karaoke Mugen is installed in /opt/karaokemugen."
    else
        echo -e "${_COL_BRED_}Karaoke Mugen is not installed in /opt/karaokemugen. Exiting."
        exit 1
    fi
}

setup_postgres() {
    echo -e "${_BEGIN_}Creating the karaokemugen_app database..."
    # Create the DB for Mugen
    # Check if the DB already exists
    sudo -u postgres -g postgres -H -- psql -d karaokemugen_app -c ""
    if [ $? -eq 0 ]; then
        echo -e "${_COL_YELLOW_}karaokemugen_app database is existing, do you want to keep its content or reset it?"
        select dbch in "Keep data" "Reset database"; do
            case $dbch in
                "Keep data" ) echo -e "${_COL_GREEN_}karaokemugen_app database will be used." ; return 0;; # TODO : maybe do some integrity checks
                "Reset database" ) sudo -u postgres -g postgres -H -- psql -c "DROP DATABASE karaokemugen_app; DROP ROLE IF EXISTS karaokemugen_app;";;
            esac
        done
    fi
    # Creating the database
    sudo -u postgres -g postgres -H -- psql -c "CREATE DATABASE karaokemugen_app ENCODING 'UTF8';"
    sudo -u postgres -g postgres -H -- psql -c "CREATE USER karaokemugen_app WITH ENCRYPTED PASSWORD 'musubi'; GRANT ALL PRIVILEGES ON DATABASE karaokemugen_app TO karaokemugen_app;"
    sudo -u postgres -g postgres -H -- psql -d karaokemugen_app -c "CREATE EXTENSION unaccent;"
    echo -e "${_COL_GREEN_}karaokemugen_app database created!"
}

apply_config() {
    # TODO : interactively ask for some options (location of medias, etc...)
    sudo tee /opt/karaokemugen/config.yml > /dev/null <<EOT
App:
  JwtSecret: $(uuid)
System:
  Binaries:
    Postgres:
      Linux: /usr/bin/
EOT
}

create_system_group() {
    if grep -q "^karaokemugen:" /etc/group; then
        echo -e "${_BEGIN_}Using the existing ${_COL_YELLOW_}karaokemugen${_COL_BBLUE_} system group..."
    else
        echo -e "${_BEGIN_}Creating ${_COL_YELLOW_}karaokemugen${_COL_BBLUE_} system group..."
        sudo groupadd karaokemugen
    fi
}

add_user_to_group() {
    echo -e "${_BEGIN_}Adding you (${_COL_YELLOW_}$USER${_COL_BBLUE_}) to ${_COL_YELLOW_}karaokemugen${_COL_BBLUE_} group..."
    if grep -q "^karaokemugen:" /etc/group; then
        sudo usermod -a -G karaokemugen $USER
        echo -e "${_COL_GREEN_}Successfully added ${_COL_YELLOW_}$USER${_COL_GREEN_} to ${_COL_YELLOW_}karaokemugen${_COL_GREEN_} group"
    else
        echo -e "${_BEGIN_}You need first to install Karaoke Mugen by executing ${_COL_YELLOW_}\`karaokemugen-install\`${_COL_BBLUE_}."
        exit 1
    fi
}

# use colors only if we have them
if [[ $(which tput > /dev/null 2>&1 && tput -T "${TERM}" colors || echo -n '0') -ge 8 ]] ; then
    _COL_YELLOW_='\e[0;33m'
    _COL_GREEN_='\e[0;32m'
    _COL_LIGHTGREY_='\e[0;37m'
    _COL_BRED_='\e[1;31m'
    _COL_BBLUE_='\e[1;34m'
    _COL_BWHITE_='\e[1;37m'
    _COL_DEFAULT_='\e[0m'
    _BEGIN_="${_COL_BRED_}-> ${_COL_BBLUE_}"
fi

while getopts ":g" opt; do
  case ${opt} in
    g )
      #target=$OPTARG
      echo -e "${_COL_YELLOW_}You may have to enter your sudo password"
      add_user_to_group
      echo -e "${_BEGIN_}Done! You need to restart your session to apply these changes."
      exit 0
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

echo -e "${_BEGIN_}Welcome to the Karaoke Mugen installer!"
echo -e "${_COL_YELLOW_}⚠️ You may have to enter your sudo password a couple times during this installation."
echo -e "${_COL_YELLOW_}This script may not work if you tweaked your PostgreSQL configuration."
echo -e "${_COL_YELLOW_}If you encounter any problems during installation, contact the package maintainer."
echo -e "${_COL_YELLOW_}The installation will begin in 5 seconds."
sleep 5

echo -e "${_BEGIN_}Doing some initial checks..."
check_postgres
check_mugen

setup_postgres

create_system_group
add_user_to_group
sudo chown -R root:karaokemugen /opt/karaokemugen

apply_config

