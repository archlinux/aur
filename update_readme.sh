#!/usr/bin/env bash

rm -rf README.md

wget -O README.md.1 "https://raw.githubusercontent.com/Puchaczov/Musoq/master/README.md"
wget -O README.md.2 "https://raw.githubusercontent.com/Puchaczov/Musoq.DataSources/main/readme.md"
wget -O README.md.3 "https://raw.githubusercontent.com/Puchaczov/Musoq.CLI/main/README.md"

sed -s -e '${p;g;}' ./README.md.{1,2,3} | sed -e '$d' > ./README.md

rm -rf ./README.md.{1,2,3}
