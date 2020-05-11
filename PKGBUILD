# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fortio-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='Fortio load testing library, command line tool, advanced echo server and web UI in go (golang). Allows to specify a set query-per-second load and record latency histograms and other useful stats'
arch=('x86_64')
url="https://fortio.org"
license=('Apache')
makedepends=('tar')
provides=('fortio')
noextract=("${pkgname}-${pkgver}")
source=("${pkgname}-${pkgver}.tgz::https://github.com/fortio/fortio/releases/download/v${pkgver}/fortio-linux_x64-${pkgver}.tgz")
sha256sums=('07798ed244369be1cd8923ebb3831f2e170017300288fafad4c38009ecaa4627')

package() {
  cd "${srcdir}"
  tar xvf ${pkgname}-${pkgver}.tgz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et: