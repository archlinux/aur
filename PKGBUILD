# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=parpd
pkgver=1.5
pkgrel=1
pkgdesc="Proxy-ARP daemon"
arch=(i686 x86_64)
url="https://github.com/rsmarples/parpd"
license=(BSD)
_commit=824058cf5e9b92efce5947cc72f4d23ff2e4ffba # 1.5
source=("git+https://github.com/rsmarples/parpd#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" BINDIR="/usr/bin" install
}

# vim: ts=2:sw=2:et
