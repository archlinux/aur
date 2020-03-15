# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=toxiproxy-cli-bin
pkgver=2.1.4
pkgrel=1
pkgdesc='A TCP proxy to simulate network and system conditions for chaos and resiliency testing (CLI client)'
arch=('x86_64')
url="http://toxiproxy.io"
license=('MIT')
provides=('toxiproxy-cli')
source=("https://github.com/Shopify/toxiproxy/releases/download/v${pkgver}/toxiproxy-cli-linux-amd64")
md5sums=('2847f49e7206e839fde02f91f7e10c0f')

package() {
	cd "${srcdir}"
	install -Dm755 toxiproxy-cli* "${pkgdir}/usr/bin/toxiproxy-cli"
}
# vim:set ts=2 sw=2 et: