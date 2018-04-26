#!/bin/bash

# Simploripsum, a simple lorem ipsum fetcher from loripsum.net
# Copyright (C) 2018 deusstultus
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
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# NOTE: The author has no affiliation with loripsum.net, this script is simply
# using the public API.

PARAGRAPH_COUNT=1
PARAGRAPH_LENGTH='medium'
ALLCAPS=false
PRUDE=false
PLAINTEXT=true
HTML=false
HTML_OL=false
HTML_UL=false
HTML_DL=false
HTML_BQ=false
HTML_CODE=false
HTML_HEADERS=false

API_ALLCAPS='allcaps'
API_PRUDE='prude'
API_PLAINTEXT='plaintext'
API_HTML='' #default
API_HTML_OL='ol'
API_HTML_UL='ul'
API_HTML_DL='dl'
API_HTML_BQ='bq'
API_HTML_CODE='code'
API_HTML_HEADERS='headers'

MAIN_PARAMS=('API_ALLCAPS' 'API_PRUDE' 'API_PLAINTEXT' 'API_HTML')
HTML_PARAMS=('API_HTML_OL' 'API_HTML_UL' 'API_HTML_DL' 'API_HTML_BQ'
             'API_HTML_CODE' 'API_HTML_HEADERS')

URL='https://loripsum.net/api'

HELP_TEXT=$(cat <<HELP
USAGE
simploripsum [OPTIONS]

  --count             the number of paragraphs to request (default=1)
  --short             use short paragraph length
  --medium            use medium paragraph length (default)
  --long              use long paragraph length
  --allcaps           use all caps
  --prude             prude version, when six and man are too risque
  --plaintext         return without HTML elements (default)

  --html              return with markup, more options below
  --decorate            add bold, italic and marked text
  --link                add links
  --ul                  add unordered lists
  --ol                  add ordered lists
  --dl                  add description lists
  --bq                  add blockquotes
  --code                add code samples
  --headers             add headers
HELP
  #Specified in API definition, but endpoint is invalid
  #--verylong, -v          short method for --length=verylong
)

for ARG in $@
do
  case $ARG in
    --count=[0-9]*)
      PARAGRAPH_COUNT=${ARG#*=};;

    --short)
      PARAGRAPH_LENGTH='short';;

    --medium)
      PARAGRAPH_LENGTH='medium';;

    --long)
      PARAGRAPH_LENGTH='long';;

    --allcaps)
      ALLCAPS=true;;

    --prude)
      PRUDE=true;;

    --plaintext)
      PLAINTEXT=true;
      HTML=false;;

    --html)
      HTML=true;
      PLAINTEXT=false;;

    --ul)
      HTML_UL=true;;

    --ol)
      HTML_OL=true;;

    --dl)
      HTML_DL=true;;

    --bq)
      HTML_BQ=true;;

    --code)
      HTML_CODE=true;;

    --headers)
      HTML_HEADERS=true;;

    *)
      fmt -s << HELP
$HELP_TEXT
HELP
      exit 0;;
  esac
done

ENDPOINT_STRING="${PARAGRAPH_COUNT}/${PARAGRAPH_LENGTH}/"
for PARAM in ${MAIN_PARAMS[*]}
do
  NEW_PARAM=${PARAM#API_}
  if [[ ${!NEW_PARAM} != 'false' ]]; then
    ENDPOINT_STRING+="${!PARAM}/"
  fi
done    

if ( $HTML ) then
  for PARAM in ${HTML_PARAMS[*]}
  do
    NEW_PARAM=${PARAM#API_}
    if [[ ${!NEW_PARAM} != 'false' ]]; then
      ENDPOINT_STRING+="${!PARAM}/"
    fi
  done    
fi

FULL_URL=$URL/$ENDPOINT_STRING

#Trim any incidental '//' and GET
curl -G ${FULL_URL//\/\//\/}
