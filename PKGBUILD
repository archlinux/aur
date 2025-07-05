# Maintainer: Eve Kolb <evekolb2204@gmail.com>
pkgname=grizzly-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="A utility for managing Jsonnet dashboards against the Grafana API"
arch=('x86_64')
url="https://github.com/grafana/grizzly"
license=('Apache-2.0')
source=("https://github.com/grafana/grizzly/releases/download/v${pkgver}/grr-linux-amd64")
noextract=("grr-linux-amd64")
sha256sums=('d708850daf00234281e328f551be7a0daf1de43acdf485d2700444d9c50e5d6e')
conflicts=("grizzly")
package() {
	cd "${srcdir}"
	install -Dm755 "grr-linux-amd64" "$pkgdir/usr/bin/grr"
}

