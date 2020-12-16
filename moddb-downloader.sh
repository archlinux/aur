# An hardcoded stupid script to download from ModDB
# Sorry no integrity check for now
base="${1}"
addons="${2}"
_mainid=201571
_addonsid=201574
_urlmain=$(curl --silent https://www.moddb.com/downloads/start/${_mainid}/all | grep -Po '(?<=href="/)[^"]*' | head -1)
_urladdons=$(curl --silent https://www.moddb.com/downloads/start/${_addonsid}/all | grep -Po '(?<=href="/)[^"]*' | head -1)
echo "Downloading ${base}"
curl -# -L -C - "https://www.moddb.com/${_urlmain}" -o \
  "${base}"
echo "Downloading ${addons}"
curl -# -L -C - "https://www.moddb.com/${_urladdons}" -o \
  "${addons}"
