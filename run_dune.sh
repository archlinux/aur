#!/bin/sh

pkgname=dosbox-dune

usage="$(basename "$0") [-h] [-l en|fr|dt] -- program to run the dune game with dosbox.

Run the dosbox command on the DUNE.BAT corresponding to the choosen language (default: english)

where:
    -h  show this help text
    -l  set the language , 'en' for English, 'fr' for French, 'dt' for German

Note : All the files of the game are put in the ~/.${pkgname} directory."


language='en'
while getopts ':hl:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    l) language=$OPTARG
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done


case "$language" in
 en) languagename='English'  
     languagefile='DUNE_EN.BAT'  
    ;;
 fr) languagename='French'  
     languagefile='DUNE_FR.BAT'  
    ;;
 dt) languagename='German'  
     languagefile='DUNE_DT.BAT'  
    ;;
 *) printf "illegal language: -%s\n" "$OPTARG" >&2
    echo "$usage" >&2
    exit 1
    ;;
esac


echo "${languagename} language chosen, use -l to change language, -h to see help"

# Copy every file in home, otherwise cannot save
mkdir -p ~/.${pkgname}/
shopt -s extglob
# Copy everything except the current file
# Do not overwrite the existing files
cp -n /opt/${pkgname}/!(*.sh) ~/.${pkgname}/

# Run the game 
dosbox ~/.${pkgname}/${languagefile}
