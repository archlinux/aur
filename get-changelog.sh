#!/bin/sh

if [ -z "$1" ]; then
	echo ':: Missing argument'
else
	curl -LO "https://github.com/rallytools/rallyresttoolkitforpython/raw/$1/VERSIONS"
fi
