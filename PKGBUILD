# Maintainer: Ben Westover <kwestover [dot] kw [at] gmail [dot] com>

pkgname=currentime
pkgver=1.0
pkgrel=2
pkgdesc="Utility written in bash that tells the time in many different formats"
arch=('any')
url="https://benthetechguy.github.io/miscprograms/$pkgname"
license=('GPL')
source=("https://raw.githubusercontent.com/benthetechguy/miscprograms/master/$pkgname/$pkgname")
noextract=('$pkgname')
sha256sums=('757398c5ce19248dd391fa0bc759c5a82d2fe20b5f41d26789d74a97d7a250d1')
package() {
	install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
