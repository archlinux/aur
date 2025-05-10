# Maintainer: Florian Loitsch <florian@toit.io>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname='jaguar-bin'
pkgver=1.51.0
pkgrel=1
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
provides=('jaguar')
conflicts=('jaguar')
source=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('4ada7c7cb418f360cf04a29a99e73c7b42e44a40ace64bfda4446878bbe5d0c5')

package() {
	install -D jag -t "$pkgdir/usr/bin/"
}
