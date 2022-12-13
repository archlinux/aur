# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=terminalpp-bin
pkgver=0.8.4
pkgrel=1
pkgdesc='Minimalist, fast, cross-platform terminal emulator'
arch=('x86_64')
url='https://terminalpp.com'
license=('MIT')
provides=('terminalpp')
depends=('libxft' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.rpm::https://github.com/terminalpp/terminalpp/releases/download/v${pkgver}/terminalpp.rpm"
        'LICENSE::https://github.com/terminalpp/terminalpp/raw/master/LICENSE.md')
sha256sums=('c04fb7e59d9f7ebb9a3b6899fb507b8265b60a6f10bf40ab59a818783bf06a7a'
            '5560b44d8082b623c288cefd5de25c8be7b6b3711bb2f4af070deb057d2d8de7')

package() {
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -aR usr "${pkgdir}"
  rm -rf "${pkgdir}/usr/lib"
}
# vim:set ts=2 sw=2 et:
