# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fabio-bin
pkgver=1.5.13
pkgrel=1
pkgdesc='Consul Load-Balancing made simple'
arch=('x86_64')
url="https://fabiolb.net"
license=('MIT')
provides=('fabio')
source=("https://github.com/fabiolb/fabio/releases/download/v${pkgver}/fabio-${pkgver}-go1.13.4-linux_amd64")
md5sums=('0ebff3ca17d1d5a43fc39b72b6502b64')

package() {
	cd "${srcdir}"
	install -Dm755 fabio* "${pkgdir}/usr/bin/fabio"
}
# vim:set ts=2 sw=2 et: