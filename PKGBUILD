# Maintainer: saltedcoffii <55339220+saltedcoffii@users.noreply.github.com>
pkgname=pakitheme
pkgver=0.1
pkgrel=1
pkgdesc="Automatically install your host GTK+ theme as a Flatpak."
arch=('any')
url="https://github.com/refi64/pakitheme"
license=('MPL2')
depends=(flatpak)
source=("https://raw.github.com/saltedcoffii/pakitheme/master/pakitheme")
md5sums=("21a75533ff1f3bc293a8ea39f74fd685")

package() {
	mkdir -p $pkgdir/usr/bin
	install ./pakitheme "$pkgdir/usr/bin"
}
