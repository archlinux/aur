# Maintainer: Doug Richardson <dougie.richardson@gmail.com>
# /etc/systemd/resolved.conf.d/*.conf.
pkgname=disable-resolved-llmnr
pkgver=1.0.0
pkgrel=1
pkgdesc="Disable Link Local Multicast Name Resolution (LLMNR)."
arch=(any)
url="https://github.com/drichardson/arch_packages"
license=('BSD')
depends=(systemd)
optdepends=()
backup=()
changelog=
install=disable-llmnr.install
source=('disable-llmnr.conf')
sha256sums=('7d9b946ee39a20c901b3fdf65bb49f70d19d0ce3ad1570975601b56e7288740e')

package() {
  install -Dm644 "$srcdir"/disable-llmnr.conf "$pkgdir"/etc/systemd/resolved.conf.d/disable-llmnr.conf
}

