# Maintainer: cylgom <cylgom-at-protonmail-dot-com>

pkgname=stormdrops-cursor-theme
pkgver=2.0
pkgrel=1
pkgdesc="StormDrops Cursor Theme"
arch=('any')
url="https://www.gnome-look.org/p/999808/"
license=('WTFPL')
depends=('tar')
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1460734986/s/8ae38eedfd63ba0d993a2a39fe051705/t/1516624220/u//168310-StormDrops-cursors.tar.gz")
md5sums=('93d8777443deade775c99e4ccb141a19')

package() {
    install -d $pkgdir/usr/share/icons/StormDrops-cursors-dark
    install -d $pkgdir/usr/share/icons/StormDrops-cursors-light
    cp -rf $srcdir/StormDrops-cursors-dark/* $pkgdir/usr/share/icons/StormDrops-cursors-dark
    cp -rf $srcdir/StormDrops-cursors-light/* $pkgdir/usr/share/icons/StormDrops-cursors-light
}
