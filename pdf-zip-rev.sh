#!/bin/bash

### Author: Anonymous.

extendedhelp="### $0
# 
# As 'pdf-zip', but the second input file will be reversed, thus
# enabling to directly combine two PDFs back into one document which
# were created by scanning several pieces of paper on front and back
# side with a non-duplex automatic document feeding scanner.
# 
# Takes two input PDF files, and writes an output PDF file.
# Thereby using the pages from the first input file as the odd pages
# of the output file and the pages of the second input file as the
# even pages of the output file IN REVERSED ORDER.
# 
# In more detail, if o ('odd') is a page number of the first input
# file, e ('even') is a page number of the second input file and
# r ('result') is a page number of the output file, the following
# relations should hold true:
# 
#   2*(E-e+1) --> r (for     r/2 a natural number)
#   2*o - 1   --> r (for (r+1)/2 a natural number),
# 
# where E is the total number of pages in the second input file.
# 
# In case one input file is too short to fill up, the above relations
# will _not_ hold true after one input file ran out of pages; instead,
# the output file will just be filled up with the remaining pages of
# the longer input file.
# 
# Internally, 'pdftk' does the work, and this is just a script
# wrapping around 'pdftk'.
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
  echo "  $0 <odd_pages_pdf_input_file> <even_pages_pdf_input_file> [<pdf_output_file> [<additional_pdftk_options>]]"
  echo "(<pdf_output_file> defaults to '${output_file_default}')"
  echo "For example, specify 'verbose' as an additional pdftk-option to get verbose output."
}

printextendedhelp() {
  echo "${extendedhelp}"
}

if [ "$#" -lt "2" ]; then
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

oddinput_file="$1"
eveninput_file="$2"

shift
shift

if [ "$#" -ge "1" ]; then
  output_file="$1"
  shift
else
  output_file="${output_file_default}"
fi

pdftk A="${oddinput_file}" B="${eveninput_file}" shuffle A Bend-1 output "${output_file}" "$@"
exitcode_pdftk="$?"

if [ "${exitcode_pdftk}" -ne 0 ]; then
  errmsg "$0: Error: The run of 'pdftk' produced an error. See above error message from the call to 'pdftk' for details."
fi
exit "${exitcode_pdftk}"

