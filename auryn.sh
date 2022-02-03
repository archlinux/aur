#!/bin/bash
#           The AUR Helper Installer
#  ░█████╗░██╗░░░██╗██████╗░██╗░░░██╗███╗░░██╗
#  ██╔══██╗██║░░░██║██╔══██╗╚██╗░██╔╝████╗░██║
#  ███████║██║░░░██║██████╔╝░╚████╔╝░██╔██╗██║
#  ██╔══██║██║░░░██║██╔══██╗░░╚██╔╝░░██║╚████║
#  ██║░░██║╚██████╔╝██║░░██║░░░██║░░░██║░╚███║
#  ╚═╝░░╚═╝░╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚══╝
#
# Auryn - The AUR Helper installer
# Copyright (C) 2022  Ivan Maruca <ivan dot maruca at gmail dot com>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/gpl-3.0.html>.
##############################################
declare -r AURYN_VERSION="0.0.1"
##############################################
# Colour constants
declare -r \
        ansi_black='\033[30m' \
        ansi_black_bold='\033[0;30;1m' \
        ansi_red='\033[31m' \
        ansi_red_bold='\033[0;31;1m' \
        ansi_green='\033[32m' \
        ansi_green_bold='\033[0;32;1m' \
        ansi_yellow='\033[33m' \
        ansi_yellow_bold='\033[0;33;1m' \
        ansi_blue='\033[34m' \
        ansi_blue_bold='\033[0;34;1m' \
        ansi_magenta='\033[35m' \
        ansi_magenta_bold='\033[0;35;1m' \
        ansi_cyan='\033[36m' \
        ansi_cyan_bold='\033[0;36;1m' \
        ansi_white='\033[37m' \
        ansi_white_bold='\033[0;37;1m' \
        ansi_reset='\033[0m'

declare -r ansi_grey="$ansi_black_bold"

declare -rA ANSI_COLOR=(
    [black]="$ansi_black"
    [black_bold]="$ansi_black_bold"
    [grey]="$ansi_grey"
    [red]="$ansi_red"
    [red_bold]="$ansi_red_bold"
    [green]="$ansi_green"
    [green_bold]="$ansi_green_bold"
    [yellow]="$ansi_yellow"
    [yellow_bold]="$ansi_yellow_bold"
    [blue]="$ansi_blue"
    [blue_bold]="$ansi_blue_bold"
    [magenta]="$ansi_magenta"
    [magenta_bold]="$ansi_magenta_bold"
    [cyan]="$ansi_cyan"
    [cyan_bold]="$ansi_cyan_bold"
    [white]="$ansi_white"
    [white_bold]="$ansi_white_bold"
    [reset]="$ansi_reset"
)

# Colour-echo.
# Argument $1 = color (defaults to nothing if not specified)
# Other arguments will be directly forwarded to echo
#
# cecho grey hello
# cecho $ansi_grey hello
# cecho red_bold -e 'hello\nworld'
#
function cecho {
    local color=${ANSI_COLOR[$1]}
    [ -n "$color" ] || { [[ "$1" == \\033\[* ]] && color="$1" ; } && shift ;
    local opt=
    [ "$1" == "-n" ] && { opt=$1 ; shift ; }

    # Print colour escape sequences only for TTY stdout
    [ -t 1 ] && echo -ne "$color" ; echo -n "$@" ; [ -t 1 ] && echo -e $opt "$ansi_reset"
}
##############################################
CHAR__GREEN='\033[0;32m'
CHAR__RESET='\033[0m'
menuStr=""

function hideCursor(){
  printf "\033[?25l"

  # capture CTRL+C so cursor can be reset
  trap "showCursor && exit 0" 2
}

function showCursor(){
  printf "\033[?25h"
}

function clearLastMenu(){
  local msgLineCount=$(printf "$menuStr" | wc -l)
  # moves the curser up N lines so the output overwrites it
  echo -en "\033[${msgLineCount}A"

  # clear to end of screen to ensure there's no text left behind from previous input
  [ $1 ] && tput ed
}

function renderMenu(){
  local start=0
  local selector=""
  local instruction="$1"
  local selectedIndex=$2
  local listLength=$itemsLength
  local longest=0
  local spaces=""
  menuStr="\n $instruction\n"

  # Get the longest item from the list so that we know how many spaces to add
  # to ensure there's no overlap from longer items when a list is scrolling up or down.
  for (( i=0; i<$itemsLength; i++ )); do
    if (( ${#menuItems[i]} > longest )); then
      longest=${#menuItems[i]}
    fi
  done
  spaces=$(printf ' %.0s' $(eval "echo {1.."$(($longest))"}"))

  if [ $3 -ne 0 ]; then
    listLength=$3

    if [ $selectedIndex -ge $listLength ]; then
      start=$(($selectedIndex+1-$listLength))
      listLength=$(($selectedIndex+1))
    fi
  fi

  for (( i=$start; i<$listLength; i++ )); do
    local currItem="${menuItems[i]}"
    currItemLength=${#currItem}

    if [[ $i = $selectedIndex ]]; then
      selectedChoice="${currItem}"
      selector="${CHAR__GREEN}ᐅ${CHAR__RESET}"
      currItem="${CHAR__GREEN}${currItem}${CHAR__RESET}"
    else
      selector=" "
    fi

    currItem="${spaces:0:0}${currItem}${spaces:currItemLength}"

    menuStr="${menuStr}\n ${selector} ${currItem}"
  done

  menuStr="${menuStr}\n"

  # whether or not to overwrite the previous menu output
  [ $4 ] && clearLastMenu

  printf "${menuStr}"
}

function getChoice(){
  local KEY__ARROW_UP=$(echo -e "\033[A")
  local KEY__ARROW_DOWN=$(echo -e "\033[B")
  local KEY__ENTER=$(echo -e "\n")
  local captureInput=true
  local displayHelp=false
  local maxViewable=0
  local instruction="Select an item from the list:"
  local selectedIndex=0

  remainingArgs=()
  while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
      -h|--help)
        displayHelp=true
        shift
        ;;
      -i|--index)
        selectedIndex=$2
        shift 2
        ;;
      -m|--max)
        maxViewable=$2
        shift 2
        ;;
      -o|--options)
        menuItems=$2[@]
        menuItems=("${!menuItems}")
        shift 2
        ;;
      -q|--query)
        instruction="$2"
        shift 2
        ;;
      *)
        remainingArgs+=("$1")
        shift
        ;;
    esac
  done

  # just display help
  if $displayHelp; then
    echo;
    echo "Usage: getChoice [OPTION]..."
    echo "Renders a keyboard navigable menu with a visual indicator of what's selected."
    echo;
    echo "  -h, --help     Displays this message"
    echo "  -i, --index    The initially selected index for the options"
    echo "  -m, --max      Limit how many options are displayed"
    echo "  -o, --options  An Array of options for a User to choose from"
    echo "  -q, --query    Question or statement presented to the User"
    echo;
    echo "Example:"
    echo "  foodOptions=(\"pizza\" \"burgers\" \"chinese\" \"sushi\" \"thai\" \"italian\" \"shit\")"
    echo;
    echo "  getChoice -q \"What do you feel like eating?\" -o foodOptions -i \$((\${#foodOptions[@]}-1)) -m 4"
    echo "  printf \"\\n First choice is '\${selectedChoice}'\\n\""
    echo;
    echo "  getChoice -q \"Select another option in case the first isn't available\" -o foodOptions"
    echo "  printf \"\\n Second choice is '\${selectedChoice}'\\n\""
    echo;

    return 0
  fi

  set -- "${remainingArgs[@]}"
  local itemsLength=${#menuItems[@]}

  # no menu items, at least 1 required
  if [[ $itemsLength -lt 1 ]]; then
    printf "\n [ERROR] No menu items provided\n"
    exit 1
  fi

  renderMenu "$instruction" $selectedIndex $maxViewable
  hideCursor

  while $captureInput; do
    read -rsn3 key # `3` captures the escape (\033'), bracket ([), & type (A) characters.

    case "$key" in
      "$KEY__ARROW_UP")
        selectedIndex=$((selectedIndex-1))
        (( $selectedIndex < 0 )) && selectedIndex=$((itemsLength-1))

        renderMenu "$instruction" $selectedIndex $maxViewable true
        ;;

      "$KEY__ARROW_DOWN")
        selectedIndex=$((selectedIndex+1))
        (( $selectedIndex == $itemsLength )) && selectedIndex=0

        renderMenu "$instruction" $selectedIndex $maxViewable true
        ;;

      "$KEY__ENTER")
        clearLastMenu true
        showCursor
        captureInput=false
        ;;
    esac
  done
}
##############################################
function displayHelp
{
    echo "
            The AUR Helper Installer
    ░█████╗░██╗░░░██╗██████╗░██╗░░░██╗███╗░░██╗
    ██╔══██╗██║░░░██║██╔══██╗╚██╗░██╔╝████╗░██║
    ███████║██║░░░██║██████╔╝░╚████╔╝░██╔██╗██║
    ██╔══██║██║░░░██║██╔══██╗░░╚██╔╝░░██║╚████║
    ██║░░██║╚██████╔╝██║░░██║░░░██║░░░██║░╚███║
    ╚═╝░░╚═╝░╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚══╝
    ver $AURYN_VERSION
    "
        echo "
    Basic usage :"
        echo -n "
        -h:             Display this info box
        -s:             Search a package in AUR
        -S:             Install a package from AUR

    [Optional]
        -[n]s:          Search a package by name in AUR.
                        By default, the search is done by name and description.
                        To produce a more accurate search, use this option in
                        combination with 's'

    [Examples]
        Perform a search:
            auryn -s my-awesome-package
        Perform a search by package name only:
            auryn -ns my-awesome-package
        Perform an installation:
            auryn -S my-awesome-package

    [Tips]
        When you execute a search, it's possible to install
        one package from the list, select a package with arrow keys
        and press ENTER to install.
        Instead of the -S (pacman style) option, you can use -i (other installers style)


"
}

function sorryBye
{
    cecho red -ne "Sorry...Something went wrong, ${ansi_green}Bye !"
    exit 1
}

function checkDependencies
{
    local yesNo=("Yes" "No")

    if ! which git &> /dev/null; then
        printf " Ops ! command git not found"
        getChoice -q "Do you wanna install it ?" -o yesNo
        case "${selectedChoice}" in
            Yes)
                installWithPacman "--needed base-devel git"
                ;;
            No) 
                sorryBye
                ;;
        esac
    fi

    if ! which jq &> /dev/null; then
        printf " Ops ! command jq not found"
        getChoice -q "Do you wanna install it ?" -o yesNo
        case "${selectedChoice}" in
            Yes)
                installWithPacman "jq"
                ;;
            No) 
                sorryBye
                ;;
        esac
    fi
}

function searchPackages
{
    checkDependencies
    cecho yellow -ne "Searching ${ansi_magenta}$@${ansi_yellow} in AUR"
    local keywords=$( echo "$@" | sed -e 's/ /%20/g')
    local search_field="name-desc"
    if [ $OPT_BY_NAME = true ]; then
        search_field="name"
    fi
    local aur_url="https://aur.archlinux.org/rpc/?v=5&type=search&by=$search_field&arg=$keywords"
    local response_type=$(curl -s $aur_url | jq -r '.type')
    if [ "$response_type" = "error" ]; then
        local err_msg=$(curl -s $aur_url | jq '.error')
        echo $err_msg
        sorryBye
    fi
    local resultcount=$(curl -s $aur_url | jq '.resultcount')
    local results=$(curl -s $aur_url | jq -c '.results[]')
    local options=("No")
    for i in "${results[@]}"; do
        pkg=$(echo $i | jq -r '.Name')
        options+=($pkg)
    done
    if (( $resultcount > 0 )); then
        getChoice -q "Found n $resultcount results, do you wanna install one of this ?" -o options -m 5
    else
        cecho yellow "Oh No ! This is so sad...nothing is here !"
        exit 0
    fi
    case "${selectedChoice}" in
        No)
            cecho green "Ok, maybe next time !"
            ;;
        *)
            installPackage $selectedChoice
            ;;
    esac

}

function installPackage
{
    checkDependencies
    cecho green -ne "Installing ${ansi_magenta}$1${ansi_green} from AUR"
    local aur_url="https://aur.archlinux.org/rpc/?v=5&type=info&arg[]=$1"
    local response_type=$(curl -s $aur_url | jq -r '.type')
    if [ "$response_type" = "error" ]; then
        local err_msg=$(curl -s $aur_url | jq '.error')
        echo $err_msg
        sorryBye
    fi
    local resultcount=$(curl -s $aur_url | jq '.resultcount')
    if (( $resultcount == 0 )); then
        cecho yellow -ne "Sorry but...nothing is here !"
        exit 0
    fi
    git clone "https://aur.archlinux.org/$1.git" && cd $1 && makepkg -si && cd .. && sudo rm -R $1
    cecho green -ne "Done ! Do what you Dream !"
}

function installWithPacman
{
    cecho green -ne "Installing ${ansi_magenta}$1${ansi_green} with pacman"
    sudo pacman -S $1
}

PACKAGE=""
OPT_SEARCH=false
OPT_INSTALL=false
OPT_BY_NAME=false
OPT_HELP=false

while getopts ":hS:i:ns:" options; do
    case "${options}" in
    h)
        OPT_HELP=true
        ;;
    n)
        OPT_BY_NAME=true
        ;;
    s)
        PACKAGE=${OPTARG}
        OPT_SEARCH=true
        ;;
    S | i)
        PACKAGE=${OPTARG}
        OPT_INSTALL=true
        ;;
    \?)
        echo "Invalid command : $@"
        exit 1
        ;;
    esac
done

if [ $OPT_HELP = true ]; then
    displayHelp
    exit 0
fi

if [ "$PACKAGE" = "" ]; then
    echo "no package defined"
    exit 1
fi

if [ $OPT_SEARCH = true ]; then
    searchPackages $PACKAGE
fi

if [ $OPT_INSTALL = true ]; then
    installPackage $PACKAGE
fi

exit 0