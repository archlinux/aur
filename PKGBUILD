# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=terminalpp-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='Minimalist, fast, cross-platform terminal emulator'
arch=('x86_64')
url='https://terminalpp.com'
license=('MIT')
provides=('terminalpp')
depends=('libxft' 'hicolor-icon-theme' 'gcc-libs')
source=("${pkgname}-${pkgver}.rpm::https://github.com/terminalpp/terminalpp/releases/download/v${pkgver}/terminalpp.rpm"
        'LICENSE::https://github.com/terminalpp/terminalpp/raw/master/LICENSE.md')
sha256sums=('cd9f949dd84931737a2afe028df8eae831a2b04c1f97d72c6511f41c6eebec8b'
            '5560b44d8082b623c288cefd5de25c8be7b6b3711bb2f4af070deb057d2d8de7')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -aR usr "${pkgdir}"
  rm -rf "${pkgdir}/usr/lib"
}
# vim:set ts=2 sw=2 et:
