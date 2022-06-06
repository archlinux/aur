#!/usr/bin/bash

echo 'The source file for this package needs to be downloaded manually'
echo 'since it requires a login and is not redistributable.'
echo 'Please visit'
echo '  https://www.oracle.com/java/technologies/javase-jdk8-doc-downloads.html'
echo 'and download'
echo " ${1%.part}"
echo " ${2%.part}"
echo 'to your Downloads folder (XDG_DOWNLOAD_DIR) or in with the PKGBUILD.'
echo ''
echo 'Please do not post alternate sources. They are not legal. Advertising'
echo 'will get them taken down by Oracle or too much traffic. Keep it a'
echo 'secret.'
exit 1
