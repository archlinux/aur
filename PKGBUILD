# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-powerline-footer
pkgver=0.6.1
pkgrel=1
pkgdesc='Powerline-style status bar extension for pi coding agent'
arch=('any')
url='https://github.com/nicobailon/pi-powerline-footer'
license=('MIT')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/nicobailon/pi-powerline-footer/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('da31b5092c7e224ef2a1f510794fea926ea780f0aab4e211bc30f0087eb9fdc1')
install=pi-ext.install
optdepends=('pi-coding-agent' 'pi-coding-agent-git')

package() {
  install -d "${pkgdir}/usr/share/pi/extensions/powerline-footer"
  cp -a "${srcdir}/pi-powerline-footer-${pkgver}/." "${pkgdir}/usr/share/pi/extensions/powerline-footer/"
  rm -rf "${pkgdir}/usr/share/pi/extensions/powerline-footer/tests"
}
