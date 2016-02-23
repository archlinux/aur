#!/bin/sh

#let failing commands exit this script
set -e

#retrieve last version ref from github
refstring=`git ls-remote -t https://github.com/FAForever/client.git 0.11.\* | sort -t '/' -k 3 -V | tail -n 1`

#regexp capture the version
regex="tags/([0-9\.]*)$"
[[ $refstring =~ $regex ]]
version="${BASH_REMATCH[1]}"

#regexp capture the previous version
old_version=$(sed -rn 's/pkgver=([0-9\.]*)/\1/p' PKGBUILD)

read -p "Do you wish to update from version $old_version to version $version?" yn
case $yn in
    [Yy]* ) 
      #write new version into PKGBUILD file
      sed -i.bak "s/pkgver=[0-9\.]*$/pkgver=$version/g" PKGBUILD
      
      #update checksums
      updpkgsums
      
      #update .SRCINFO file
      mksrcinfo
      
      #run a makepkg to check if it still builds and installs
      makepkg -f -c
      
      #commit and push git repo
      git stage PKGBUILD .SRCINFO
      git commit -m "update to version $version"
      git push origin master
      
      ;;
    [Nn]* ) 
      exit;;
    * ) echo "Please answer yes or no.";;
esac
  
