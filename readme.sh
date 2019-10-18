#!/usr/bin/bash

echo "There is no longer a direct download link for the Zoiper tarball."
echo "Get it manually from:"
echo "  $1"
echo 'and put'
echo "  ${2%.part}"
echo 'in your ~/Downloads folder or in with the PKGBUILD.'
echo
echo "Or use the supplied zoipdl.sh"
exit 1
