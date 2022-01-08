NVERSION=`curl https://apt.connectify.me/dists/speedify/main/binary-amd64/Packages|grep Version|head -1|cut -d" " -f2`
CVERSION=`cat PKGBUILD |grep _pkgver=|cut -d= -f2`

echo "Versions: '$NVERSION' '$CVERSION'"
if [ $NVERSION != $CVERSION ]; then
    echo "Updating ..."
    sed -i "s/$CVERSION/$NVERSION/g" PKGBUILD
    #to see if it build
    makepkg
    makepkg --printsrcinfo > .SRCINFO
    git commit -am "New version $NVERSION"
    git push aur master
fi