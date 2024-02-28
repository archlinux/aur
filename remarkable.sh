#!/bin/bash
set -e

jobid=$1
cupsuser=$2
jobtitle=$3
jobcopies=$4
joboptions=$5
jobfile=${6:--}

export RMAPI_CONFIG=/etc/rmapi.conf

printtime=$(date +%Y-%b-%d-%H-%M)
sanitized_jobtitle="$(echo "$jobtitle" | tr "[[:blank:]:/%\&=+?\\\\#\'\`\´\*]" _ | sed 's/ü/u/g;s/ä/a/g;s/ö/o/g;s/Ü/U/g;s/Ä/A/g;s/Ö/O/g;s/{\\ß}/ss/g' | cut -f 1 -d '.' ).pdf"
outname=/tmp/${printtime}_${sanitized_jobtitle}

if [ ${#} -eq 0 ]; then
    # this case is for "backend discovery mode"
    echo "Remarkable Printer \"Backend to print directly to Remarkable cloud\""
    exit 0
fi

if pdfinfo "$jobfile" > /dev/null ; then
    cp "$jobfile" "$outname"
else
    ps2pdf "$jobfile" "$outname"
fi
if [ ! -e "${DEVICE_URI#remarkable:}" ]; then
    rmapi mkdir "${DEVICE_URI#remarkable:}" > /dev/null
    rmapi put "$outname" "${DEVICE_URI#remarkable:}"
else
    rmapi put "$outname"
fi

rm "$outname"

echo 1>&2

exit 0
