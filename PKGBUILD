pkgname=jaq-symlinks
pkgver=0.0.1
pkgrel=1
pkgdesc="Runs jaq if jq is called"
arch=(any)
url=https://aur.archlinux.org/packages/$pkgname
license=(GPL3)
source=()
sha256sums=()
provides=(jq)
conflicts=(jq)
depends=(jaq)

package() {
  mkdir -p $pkgdir/usr/bin
  ln -s jaq $pkgdir/usr/bin/jq
}
# ex: nowrap
