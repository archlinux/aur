# Maintainer: cylgom <cylgom-at-protonmail-dot-com>

pkgname=stormdrops-cursor-theme
pkgver=2.0
pkgrel=1
pkgdesc="StormDrops Cursor Theme"
arch=('any')
url="https://www.gnome-look.org/p/999808/"
license=('WTFPL')
depends=('tar')
source=("https://www.opendesktop.org/p/999808/startdownload?file_id=1460734986&file_name=168310-StormDrops-cursors.tar.gz&file_type=application/x-gzip&file_size=34128&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownloadfile%2Fid%2F1460734986%2Fs%2Ff1edcebbdcad563c267543e20c53f570%2Ft%2F1518532870%2Fu%2F%2F168310-StormDrops-cursors.tar.gz")
md5sums=('93d8777443deade775c99e4ccb141a19')

package() {
    install -d $pkgdir/usr/share/icons/StormDrops-cursors-dark
    install -d $pkgdir/usr/share/icons/StormDrops-cursors-light
    cp -rf $srcdir/StormDrops-cursors-dark/* $pkgdir/usr/share/icons/StormDrops-cursors-dark
    cp -rf $srcdir/StormDrops-cursors-light/* $pkgdir/usr/share/icons/StormDrops-cursors-light
}
