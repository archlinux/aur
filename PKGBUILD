# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-subagents
pkgver=0.24.3
pkgrel=1
pkgdesc='Subagents extension for pi coding agent'
arch=('any')
url='https://github.com/nicobailon/pi-subagents'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-subagents/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('65a284a49a09a6aed21c516b37f53d8b31bc87f5429a2200dcae59fed9da2395')
install=pi-ext.install

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/subagents"
  cp -a "${srcdir}/pi-subagents-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/subagents/"
  rm -rf "${pkgdir}/usr/share/pi/extensions/subagents/test"
}
