# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=toxiproxy-server-bin
pkgver=2.1.4
pkgrel=1
pkgdesc='A TCP proxy to simulate network and system conditions for chaos and resiliency testing'
arch=('x86_64')
url="http://toxiproxy.io"
license=('MIT')
provides=('toxiproxy-server')
source=("https://github.com/Shopify/toxiproxy/releases/download/v${pkgver}/toxiproxy-server-linux-amd64")
md5sums=('SKIP')

package() {
	cd "${srcdir}"
	install -Dm755 toxiproxy-server* "${pkgdir}/usr/bin/toxiproxy-server"
}
# vim:set ts=2 sw=2 et: