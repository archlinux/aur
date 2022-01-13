# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fortio-bin
pkgver=1.20.0
pkgrel=1
pkgdesc='Fortio load testing library, command line tool, advanced echo server and web UI in go (golang). Allows to specify a set query-per-second load and record latency histograms and other useful stats'
arch=('x86_64')
url="https://fortio.org"
license=('Apache')
provides=('fortio')
makedepends=('tar')
noextract=("${pkgname}-${pkgver}")
source=("${pkgname}-${pkgver}.tgz::https://github.com/fortio/fortio/releases/download/v${pkgver}/fortio-linux_x64-${pkgver}.tgz")
sha256sums=('017957c6cfe3f9706f434b5a947721e668ebdf7519f2916d7542319b8adf325a')

package() {
  cd "${srcdir}"
  tar xvf ${pkgname}-${pkgver}.tgz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
