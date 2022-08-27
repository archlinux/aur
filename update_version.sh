PKG=`curl https://apt.connectify.me/dists/speedify/main/binary-amd64/Packages`
NVERSION=`echo "$PKG"|grep speedifyui -A10|head -15|grep Version|head -1|cut -d" " -f2`
CVERSION=`cat PKGBUILD |grep _pkgver=|cut -d= -f2`
MD5=$(echo "$PKG"|grep speedifyui -A10|head -15|grep MD5sum|head -1|cut -d" " -f2)

echo "Versions: '$NVERSION' '$CVERSION'"
if [ $NVERSION != $CVERSION ]; then
    echo "Updating ..."
    sed -i "s/$CVERSION/$NVERSION/g" PKGBUILD
    sed -i "s/\(md5sums_x86_64=\).*/\1('$MD5')/" PKGBUILD
    sed -i "s/pkgrel=.*/pkgrel=0/" PKGBUILD
    #to see if it build
    makepkg
    makepkg --printsrcinfo > .SRCINFO
    git commit -am "New version $NVERSION"
    git push
fi
