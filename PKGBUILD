# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fortio-bin
pkgver=1.9.1
pkgrel=1
pkgdesc='Fortio load testing library, command line tool, advanced echo server and web UI in go (golang). Allows to specify a set query-per-second load and record latency histograms and other useful stats'
arch=('x86_64')
url="https://fortio.org"
license=('Apache')
makedepends=('tar')
provides=('fortio')
noextract=("${pkgname}-${pkgver}")
source=("${pkgname}-${pkgver}.tgz::https://github.com/fortio/fortio/releases/download/v${pkgver}/fortio-linux_x64-${pkgver}.tgz")
sha256sums=('81d823125664ec8d5aba4cb8bd09537425817f799122e1c1a0f1b65b5c0a0170')

package() {
  cd "${srcdir}"
  tar xvf ${pkgname}-${pkgver}.tgz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
