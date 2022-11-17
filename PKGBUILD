# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fortio-bin
pkgver=1.38.4
pkgrel=1
pkgdesc='Fortio load testing library, command line tool, advanced echo server and web UI in go (golang). Allows to specify a set query-per-second load and record latency histograms and other useful stats'
arch=('x86_64')
url="https://fortio.org"
license=('Apache')
provides=('fortio')
makedepends=('tar')
noextract=("${pkgname}-${pkgver}")
source=("${pkgname}-${pkgver}.tgz::https://github.com/fortio/fortio/releases/download/v${pkgver}/fortio-linux_amd64-${pkgver}.tgz")
sha256sums=('ea0cf5cf3e76957693c627b9a18c3fc41f67cb1dbb8b4625b0ee5a0308b9d7a0')

package() {
  cd "${srcdir}"
  tar xvf ${pkgname}-${pkgver}.tgz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
