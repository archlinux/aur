# Maintainer: Florian Loitsch <florian@toit.io>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname='jaguar-bin'
pkgver=1.7.14
pkgrel=1
pkgdesc="Tool to develop Toit programs for the ESP32"
arch=('x86_64')
url="https://github.com/toitlang/jaguar"
license=('MIT')
depends=('gcc-libs')
provides=('jaguar')
conflicts=('jaguar')
source=("$pkgname-$pkgver.tgz::$url/releases/download/v$pkgver/jag_linux.tgz")
sha256sums=('96135cc1cabb76e9858773f2b1ae10ea94e6ba4d379b619ba46830aa3adeead8')

package() {
	install -D jag -t "$pkgdir/usr/bin/"
}
