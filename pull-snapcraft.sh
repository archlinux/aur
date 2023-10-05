#! /bin/bash

# get latest snap json
json=$(curl -s -H 'Snap-Device-Series: 16' http://api.snapcraft.io/v2/snaps/info/spotify);

# pull out url
url=$(echo $json | jq '."channel-map" | map(select(.channel.architecture == "amd64" and .channel.name == "edge")) | .[0].download.url');
# remove quote marks from beginning and end of url
url=${url:1:-1}

# pull out version
version=$(echo $json | jq '."channel-map" | map(select(.channel.architecture == "amd64" and .channel.name == "edge")) | .[0].version');
# remove quote marks from beginning and end of url
version=${version:1:-1}
# extract commit id from the end
commit=$(echo $version | cut -d '.' -f5);
# extract the main version number
version=$(echo $version | cut -d '.' -f1-4);

# download file
wget --header='Snap-Device-Series: 16' -O /tmp/spotify.snap $url;
sum=$(sha512sum /tmp/spotify.snap | cut -d ' ' -f1);

# output the fields that need to be updated
echo "url=$url";
echo "version=$version";
echo "commit=$commit";
echo "sum=$sum";
