# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-powerline-footer
pkgver=0.14.1
pkgrel=1
pkgdesc='Powerline-style status bar extension for pi coding agent'
arch=('any')
url='https://github.com/nicobailon/pi-powerline-footer'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-powerline-footer/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('310c08c499f1ad36aec1702e2a4b45dd4ddb687d0a3dcae5bb2ac9617dfab6d0')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/powerline-footer"
  cp -a "${srcdir}/pi-powerline-footer-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/powerline-footer/"
  rm -rf "${pkgdir}/usr/share/pi/extensions/powerline-footer/tests"
}
