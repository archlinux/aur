#!/bin/bash
set -e
VERSION="Pterodactyl_panel_configuration_wizard"
WORKINGDIR=/var/www/pterodactyl
DIALOG=dialog
DIALOG1="$DIALOG --backtitle $VERSION --clear --cancel-label Exit --no-collapse"
if [[ $EUID -ne 0 ]]; then
  $DIALOG1 \
  --title "Error:" --msgbox "\nYou must be root to do this" 7 32
  #echo "You must be root to do this."
  1>&2
  exit 100
fi
ANSWER=/tmp/pterodactyl-panel-answer.tmp
HIGHLIGHT=0
panel_configure() {

  cd $WORKINGDIR
 $DIALOG1 \
 --default-item ${HIGHLIGHT} \
 --title "Pterodactyl Panel environment configuration menu" \
 --menu "NOTE #1 will overwrite existing\nPterodactyl Panel Database\nPlease select: " 0 0 5 \
  "1" "php artisan key:generate --force" \
  "2" "php artisan p:environment:setup" \
  "3" "php artisan p:environment:database" \
  "4" "php artisan p:environment:mail" \
  "5" "php artisan migrate --seed" \
  "6" "php artisan p:user:make" \
  "7" "setup sample nginx config" 2> ${ANSWER}
  HIGHLIGHT=$HIGHLIGHT++
  case $(cat ${ANSWER}) in
      "1")
      php artisan key:generate --force
      ;;
      "2")
      php artisan p:environment:setup
      ;;
      "3")
      php artisan p:environment:database
      ;;
      "4")
      php artisan p:environment:mail
      ;;
      "5")
      php artisan migrate --seed
      ;;
      "6")
      php artisan p:user:make
      ;;
      "7")
      cp -b pterodactyl.conf /etc/nginx/sites-available/pterodactyl.conf
      ln -f /etc/nginx/sites-available/pterodactyl.conf /etc/nginx/sites-available/pterodactyl.conf
      ;;
      *)
      exit 1
      ;;
  esac
panel_configure
}

while true; do
panel_configure
done
