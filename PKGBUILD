# Maintainer: Arda Yılmaz <fijarom at fijarom dot com>

pkgname=steam-hide-whats-new
pkgver=1.0.4
pkgrel=1
pkgdesc="A Bash script for hiding the \"What's New\" section in Steam"
arch=('x86_64')
url="https://sr.ht/~fijarom/steam-hide-whats-new/"
license=('GPL-3.0-or-later')
depends=('bash')

source=("git+https://git.sr.ht/~fijarom/steam-hide-whats-new")
sha256sums=('SKIP')

build() {
  :
}

package() {
  install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
