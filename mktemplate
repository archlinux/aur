#!/bin/bash -

declare -r PROGNAME=${0##*/}


function error() {
    printf "%s: %s\n" ${0##*/} "$@"
} >&2


# -----------------------------------------------------------------------
# Function to create temporary files
#   optional number of files to create--default is one
#   returns an array ($TEMP_FILE) containing temporary file names
# -----------------------------------------------------------------------
function makeTempFiles () {

    declare fnum=${1:-1} # number of temporary files to create

    # Use user's local tmp directory if it exists
    if [ -d ~/tmp ]; then
	TEMP_DIR=~/tmp
    else
	TEMP_DIR=/tmp
    fi

    # Temp files for this script, using paranoid method of creation to
    # ensure that file names are not predictable. This is for security to
    # avoid "tmp race" attacks.
    for (( n=0; n<$fnum; n++ )); do
	TEMP_FILE[$n]=$(mktemp -q "${TEMP_DIR}/${PROGNAME}.$$.XXXXXX")
	if [ "${TEMP_FILE[$n]}" = '' ]; then 
	    error 'cannot create temp file!'
            exit 1
	fi
    done
}

trap 'rm -f "${TEMP_FILE[*]}" >/dev/null 2>&1; exit' 0 1 2 3 13 15

function usage() {
cat >&2 << EOF
Usage: ${0##*/} filename
    filename: is the file to make into a template.
EOF
}


# ensure we have a real live file to work with
if ! [ "1" -eq "$#" ]; then
    error "required number of arguments is 1... number of arguments given: $#"
    usage
    exit 1
fi
if ! [ -e "$1" ]; then
    error "$1 does not exist"
    exit 1
fi
if ! [ -f "$1" ]; then
    error "$1 is not a regular file"
    exit 1
fi

# set base directory for template and .desktop file
declare -r DIR=$(kde4-config --localprefix)/share/templates # .desktop file directory
declare -r SOURCE="$DIR/.source"                            # template file directory

# make sure all required directories exist
if ! mkdir -p $SOURCE >/dev/null 2>&1 && ! [ -d $SOURCE ]; then
    error 'required directories cannot be created'
    exit 1
fi

# make sure the template and desktop files have sane names
declare -r FILE="$1"                                   # source file
declare saneName=$(sed 's/[[:space:]]/_/g'  <<< $FILE) # base name for template and desktop files
saneName=${saneName##*/}

# create .desktop filename
declare desktop=$DIR/$saneName
desktop=${desktop%.*}.desktop

# create template filename
declare template=$SOURCE/$saneName

# prompt for icon and menu entry text
icon=$(kdialog --title "Choose an Icon" --geticon Small MimeType 2>/dev/null)
if [ -z "$icon" ]; then
    error 'no icon selected'
    exit 1
fi
filetype=$(kdialog --title "Menu and Dialog Prompt Text" --inputbox "Document type:" "$(file "$FILE" | awk -F: '{print $2}' | awk -F, '{print $1}')" 2>/dev/null)
if [ -z "$filetype" ]; then
    error 'no prompt text entered'
    exit 1
fi

# create .desktop file content
makeTempFiles
cat > ${TEMP_FILE[0]} << EOF
[Desktop Entry]
Name=$filetype...
Comment=New $filetype...
Type=Link
URL=.source/$saneName
Icon=$icon
EOF


# install template and .desktop file
cp ${TEMP_FILE[0]} $desktop
cp "$FILE" $template

# report errors
if ! [ -e $desktop ]; then
    kdialog --error "$desktop could not be created"
fi
if ! [ -e $template ]; then
    kdialog --error "$template could not be created"
fi
