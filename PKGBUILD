# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>

pkgname=light-locker-shim-slock
pkgver=1
pkgrel=1
pkgdesc="Use light-locker-command as it was slock, useful for xflock4"
arch=('any')
url=""
depends=("light-locker")
conflicts=("slock")
source=("launcher")
sha256sums=('9f7dde5db95bf0360a99e0be6ac030d4da1251eb0df46b8bcb910aff6e90e87b')

package() {
  cd "$srcdir/"
  install -m755 -D launcher "$pkgdir/usr/bin/slock"
}
