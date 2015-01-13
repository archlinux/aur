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
md5sums=('3f479d07204e3067f62c5e4d6841b790')

package() {
  install -Dm644 "$srcdir"/disable-llmnr.conf "$pkgdir"/etc/systemd/resolved.conf.d/disable-llmnr.conf
}

