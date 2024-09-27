#!/bin/bash
TargetFile="/opt/QQ/resources/app/package.json"
TargetLine=$(awk "/main/{print NR}" $TargetFile)
TargetContent=$(awk -F '[:,]' '/"main"/ {gsub(/"| /, "", $2); print $2}' $TargetFile)
sed -i "${TargetLine}s!${TargetContent}!${1}!g" $TargetFile