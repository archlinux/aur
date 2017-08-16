# Maintainer: Ada Joule <ada dot fulmina at gmail dot com>
pkgname=xcursor-hacked-white
pkgver=1.0.0
pkgrel=1
pkgdesc="Hacked White cursor theme."
arch=('any')
url="https://www.gnome-look.org/p/1102526/"
license=('GPL')
source=("https://www.dropbox.com/s/d3a4ne5fcrdjkva/Hacked-White.tgz")
makedepends=('gzip')

sha256sums=('5e96ca316b389bba924d74cbfe64e5400ba19cd9ee75ce65f4b98acdf588a06a')

package() {
    cd $srcdir/Hacked-White
    install -d $pkgdir/usr/share/icons/Hacked-White
    cp -rf *   $pkgdir/usr/share/icons/Hacked-White
    chmod -R 644 $pkgdir/usr/share/icons/Hacked-White/*
    chmod 755 $pkgdir/usr/share/icons/Hacked-White
    chmod 755 $pkgdir/usr/share/icons/Hacked-White/cursors
}
