# Maintainer: saltedcoffii <55339220+saltedcoffii@users.noreply.github.com>
pkgname=pakitheme
pkgver=0.1
pkgrel=1
pkgdesc="Automatically install your host GTK+ theme as a Flatpak."
arch=('any')
url="https://github.com/refi64/pakitheme"
license=('MPL2')
depends=(flatpak)
source=("git+https://github.com/refi64/pakitheme")
md5sums=("SKIP")

package() {
	mkdir -p $pkgdir/usr/bin
	install ./pakitheme/pakitheme "$pkgdir/usr/bin"
}
