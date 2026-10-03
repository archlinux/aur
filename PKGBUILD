# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-powerline-footer
pkgver=0.19.1
pkgrel=1
pkgdesc='Powerline-style status bar extension for pi coding agent'
arch=('any')
url='https://github.com/nicobailon/pi-powerline-footer'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-powerline-footer/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('4230f94d857f2633f8c19cb686b0d781ff1c0c157e81edcad9b056286bb0b66f')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/powerline-footer"
  cp -a "${srcdir}/pi-powerline-footer-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/powerline-footer/"
  rm -rf "${pkgdir}/usr/share/pi/extensions/powerline-footer/tests"
}
