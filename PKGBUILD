# Maintainer: Istvan Tapai <iktapai@gmail.com>

pkgname=ater-yellow-cursor-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="ater-yellow cursor theme"
arch=('any')
url="https://github.com/itapai/ater-yellow"
license=("GPL")
source=("https://github.com/itapai/ater-yellow/archive/master.zip")
makedepends=('unzip')
sha1sums=('c4be275b0264d593de4b53e4cc3cacba6a7d6d73')

package()
{
    install -d -m 755 "$pkgdir/usr/share/icons/ater-yellow/cursors"
	install -D -m 644 $srcdir/index.theme "$pkgdir/usr/share/icons/ater-yellow/index.theme"
    cp -r $srcdir/cursors "$pkgdir/usr/share/icons/ater-yellow/cursors" 
}

