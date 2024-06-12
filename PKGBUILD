# Maintainer: Eve Kolb <evekolb2204@gmail.com>
pkgname=grizzly-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="A utility for managing Jsonnet dashboards against the Grafana API"
arch=('x86_64')
url="https://github.com/grafana/grizzly"
license=('Apache-2.0')
source=("https://github.com/grafana/${pkgname}/releases/download/v${pkgver}/grr-linux-amd64")
noextract=("grr-linux-amd64")
sha256sums=('4916dedfc7d5645a764e1aa801b6903abc7a332b88b1e670bb91e3c74418adbd')
package() {
	cd "${srcdir}"
	install -Dm755 "grr-linux-amd64" "$pkgdir/usr/bin/grr"
}

