#!/usr/bin/env bash

curl -s 'https://bootstrapstudio.io/pages/releases/feed' | \
grep '<title>' | \
sed -n '2p' | \
sed 's|<title>||g' | \
sed 's|</title>||g' | \
sed 's|Bootstrap Studio ||g' | \
sed 's| ||g'
