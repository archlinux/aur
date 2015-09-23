#!/bin/bash

### Author: Anonymous.

extendedhelp="### $0
# 
# Takes a pdf file, and reverses it's page order.
# 
###"

output_file_default='/dev/stdout'

errmsg() {
  if [ "$#" -ge "1" ]; then
    msg="$1"
  else
    msg="$0: Unspecified error."
  fi
  
  echo "${msg}" >> /dev/stderr
}

exiterror() {
  if [ "$#" -ge "1" ]; then
    msg="$1"
  else
    msg="$0: Unspecified error."
  fi
  
  if [ "$#" -ge "2" ]; then
    exitcode="$2"
  else
    exitcode=2
  fi
  
  errmsg "${msg}"
  exit "${exitcode}"
}

printusage() {
  echo "Usage:"
  echo "  $0 <pdf_input_file> [<pdf_output_file> [<additional_pdftk_options>]]"
  echo "(<pdf_output_file> defaults to '${output_file_default}')"
  echo "For example, specify 'verbose' as an additional pdftk-option to get verbose output."
}

printextendedhelp() {
  echo "${extendedhelp}"
}

if [ "$#" -lt "1" ]; then
  errmsg "$0: Error: Too few arguments specified."
  errmsg ""
  errmsg "$(printusage)"
  errmsg ""
  errmsg "=== Extended information on this software: ==="
  errmsg ""
  errmsg "$(printextendedhelp)"
  errmsg ""
  exiterror "$0: Aborting, since too few arguments specified." 1
fi

input_file="$1"

shift

if [ "$#" -ge "1" ]; then
  output_file="$1"
  shift
else
  output_file="${output_file_default}"
fi

pdftk "${input_file}" cat end-1 output "${output_file}" "$@"
exitcode_pdftk="$?"

if [ "${exitcode_pdftk}" -ne 0 ]; then
  errmsg "$0: Error: The run of 'pdftk' produced an error. See above error message from the call to 'pdftk' for details."
fi
exit "${exitcode_pdftk}"

