# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Marius Zukaitis <marius@shadownest.tk>
pkgname=spice-html5
pkgver=0.3.0
pkgrel=1
pkgdesc="html5 client for the spice protocol."
arch=('any')
url="https://gitlab.freedesktop.org/spice/spice-html5"
license=('GPL')
source=("https://gitlab.freedesktop.org/spice/$pkgname/-/archive/$pkgname-$pkgver/$pkgname-$pkgname-$pkgver.tar.gz")

package() {
	cd "$srcdir/$pkgname-$pkgname-$pkgver/"
	make DESTDIR="$pkgdir/" install
}
sha256sums=('90fa3b30cda272471104af0b61ea08f2194048455133889a28a8bed0c00e3527')
