# Maintainer: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgname=tempconvert
pkgver=1.0
pkgrel=2
pkgdesc="Utility written in bash for converting temperatures between Fahrenheit and Celsius."
arch=('any')
url="https://benthetechguy.github.io/miscprograms/$pkgname"
license=('GPL')
depends=('bc')
source=("https://raw.githubusercontent.com/benthetechguy/miscprograms/master/$pkgname/$pkgname")
noextract=('$pkgname')
sha256sums=('30aa70bb28a2c5a3d81d69f06387a4660e69d65e355a0b14618ba77e0f120519')
package() {
	install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
