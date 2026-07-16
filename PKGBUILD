# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-powerline-footer
pkgver=0.7.0
pkgrel=1
pkgdesc='Powerline-style status bar extension for pi coding agent'
arch=('any')
url='https://github.com/nicobailon/pi-powerline-footer'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-powerline-footer/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('c88e4a24d95f098f00f0a782818b727ad4efd6e03645dab76c79608fc3d1bb65')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/powerline-footer"
  cp -a "${srcdir}/pi-powerline-footer-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/powerline-footer/"
  rm -rf "${pkgdir}/usr/share/pi/extensions/powerline-footer/tests"
}
