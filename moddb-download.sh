#!/bin/sh -e
curl -C- -o $1 -SL https://www.moddb.com$(curl -sSL $2 | tidy -quiet -numeric -asxml -utf8 2>/dev/null | xmlstarlet select -N "x=http://www.w3.org/1999/xhtml" -t -v "/x:html/x:body/x:p/x:a[1]/@href")
