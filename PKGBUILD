# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-powerline-footer
pkgver=0.6.0
pkgrel=1
pkgdesc='Powerline-style status bar extension for pi coding agent'
arch=('any')
url='https://github.com/nicobailon/pi-powerline-footer'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-powerline-footer/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('25a227643f7bddca27dd4822edd84c6b42c50fc88468a0648c31c6a2b02fd25a')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/powerline-footer"
  cp -a "${srcdir}/pi-powerline-footer-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/powerline-footer/"
  rm -rf "${pkgdir}/usr/share/pi/extensions/powerline-footer/tests"
}
