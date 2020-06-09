#!/bin/sh

# This script requires html2text
if ! which html2text > /dev/null 2>&1; then
	echo html2text required to generate LICENSE file
	exit 1
fi

curl -LO https://ngrok.com/tos

html2text tos > LICENSE

echo "LICENSE downloaded - You may need to remove the site header and footer"

rm tos

