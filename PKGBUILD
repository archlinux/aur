# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fabio-bin
pkgver=1.5.13
pkgrel=2
pkgdesc='Consul Load-Balancing made simple'
arch=('x86_64')
url="https://fabiolb.net"
license=('MIT')
provides=('fabio')
source=("${pkgname}-${pkgver}::https://github.com/fabiolb/fabio/releases/download/v${pkgver}/fabio-${pkgver}-go1.13.4-linux_amd64"
		'LICENSE::https://raw.githubusercontent.com/fabiolb/fabio/master/LICENSE')
sha256sums=('716aaa264e2ffb7a98a574220e0e20d7d40e2f1b2717584d6f260e01f89220fc'
			'1b96863084c41c1557336dad7193f7b0d4c03042481da83136b53940ea5a3083')

package() {
  install -Dm755 "${srcdir}"/fabio* "${pkgdir}/usr/bin/fabio"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et: