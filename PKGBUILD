# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fabio-bin
pkgver=1.5.14
pkgrel=1
pkgdesc='Consul Load-Balancing made simple'
arch=('x86_64')
url="https://fabiolb.net"
license=('MIT')
provides=('fabio')
source=("${pkgname}-${pkgver}::https://github.com/fabiolb/fabio/releases/download/v${pkgver}/fabio-${pkgver}-go1.15-linux_amd64"
    'LICENSE::https://raw.githubusercontent.com/fabiolb/fabio/master/LICENSE')
sha256sums=('51ce031a2f58f316937a8bb32b5df06955e49219b6676ec456fcb8c4a402fc13'
            '1b96863084c41c1557336dad7193f7b0d4c03042481da83136b53940ea5a3083')

package() {
  install -Dm755 "${srcdir}"/fabio* "${pkgdir}/usr/bin/fabio"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
