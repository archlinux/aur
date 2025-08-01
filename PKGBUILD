# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=otf-optician-sans
pkgdesc='Font based on the historical eye charts and optotypes used by opticians'
pkgver=2
pkgrel=1
url=https://optician-sans.com
arch=(any)
license=(OFL-1.1)
source=("$pkgname-v$pkgver.zip::$url/font-files/v$pkgver/OpticianSans.zip")
sha256sums=('1d6d59f89fa7e0caa6fadca140f8affab14a17b6ecc22934eeff92efa5a44dc5')

build () {
	: Nothing to build
}

package () {
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" "$srcdir/Optician-Sans.otf"
}
