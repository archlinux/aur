#!/bin/bash
#
# call with booklet file.pdf
#
# Original by Michael Roessler (http://www.pro-linux.de/kurztipps/2/1387/comm/454512/re-din-a5-buch-erstellen.html)
# Slightly adapted by Dominik Mayer (dominik.mayer@gmail.com)
# Version 1.0

file=$1
filebase=`basename "$file" .pdf`
pdftops "$file" output.ps
psbook output.ps tmp.ps
pstops -pa4 "4:0L@.707(21cm,0)+1L@.707(21cm,14.85cm),2R@.707(0,29.7cm)+3R@.707(0,14.85cm)" tmp.ps > "${filebase}-booklet.ps"
rm -f output.ps tmp.ps
echo "Converting back to pdf ..."
ps2pdf -sPAPERSIZE=a4 "${filebase}-booklet.ps"
rm -f "${filebase}-booklet.ps"
