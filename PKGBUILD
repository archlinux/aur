# Maintainer: Victor Zamanian <victor.zamanian@gmail.com>

_pkgname=enact
pkgname=${_pkgname}-bin
pkgver=0.1
pkgrel=1
pkgdesc="Easy dual-monitor setup and hotplug support for minimalistic window managers"
arch=('x86_64')
url="https://github.com/chmln/enact"
license=('unknown')
source=("${url}/releases/download/v${pkgver}/enact")
md5sums=('07f0f0e2b7feccb07c1251f0b507a2a3')

package() {
  install -dm 644 "${pkgdir}/usr/bin"
  install -m 755 enact -t "${pkgdir}/usr/bin"
}
