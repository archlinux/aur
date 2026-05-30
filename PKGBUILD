# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-subagents
pkgver=0.26.0
pkgrel=1
pkgdesc='Subagents extension for pi coding agent'
arch=('any')
url='https://github.com/nicobailon/pi-subagents'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-subagents/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('436972b7d57bc1b86e55b0bf435948da181f4bc47e689006086ea9e44baa02b5')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/subagents"
  cp -a "${srcdir}/pi-subagents-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/subagents/"
  rm -rf "${pkgdir}/usr/share/pi/extensions/subagents/test"
}
