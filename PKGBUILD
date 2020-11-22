# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fortio-bin
pkgver=1.11.3
pkgrel=1
pkgdesc='Fortio load testing library, command line tool, advanced echo server and web UI in go (golang). Allows to specify a set query-per-second load and record latency histograms and other useful stats'
arch=('x86_64')
url="https://fortio.org"
license=('Apache')
provides=('fortio')
makedepends=('tar')
noextract=("${pkgname}-${pkgver}")
source=("${pkgname}-${pkgver}.tgz::https://github.com/fortio/fortio/releases/download/v${pkgver}/fortio-linux_x64-${pkgver}.tgz")
sha256sums=('7a47adb5fc76dba86566d7b50f4ce3e78ce400b2f6496474ddfa80f1621e2ab2')

package() {
  cd "${srcdir}"
  tar xvf ${pkgname}-${pkgver}.tgz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
