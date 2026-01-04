# Maintainer: T-1990 <address at domain dot>

pkgname=ttf-piboto
pkgver=1.2
pkgrel=1
pkgdesc='Piboto is a fork of Roboto before the 2014 redesign.'
url="https://archive.raspberrypi.org/debian/pool/main/f/fonts-piboto/"
license=(custom:OFL)
arch=(any)

source=("https://archive.raspberrypi.org/debian/pool/main/f/fonts-piboto/fonts-piboto_1.2.tar.xz")
md5sums=('dc8dca7ab4ca8805b9e1b6c8f1959df4')

package() {
	install -Dm644 "$srcdir/fonts-piboto-1.2/Piboto-"*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
	install -Dm644 "$srcdir/fonts-piboto-1.2/PibotoCondensed-"*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
}
