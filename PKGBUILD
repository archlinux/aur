# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vg-bin
pkgver=0.9.0
pkgrel=2
pkgdesc='Virtualgo: Easy and powerful workspace based development for go'
arch=('x86_64')
url="https://github.com/GetStream/vg"
license=('MIT')
provides=('vg')
depends=('glibc')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/vg-linux-amd64"
        'LICENSE::https://github.com/GetStream/vg/raw/master/LICENSE')
sha256sums=('9e9ef148ec723b3d1c0d737ed49222409325c9f801aebd9d2bb9dc02a1e3a651'
            '9c90e4c371a644b6968d97d5aaec69d6ebb922ea986b9b17ce58e2afb2fa2d12')

package() {
  install -Dm755 "${srcdir}"/vg-* "${pkgdir}/usr/bin/vg"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: