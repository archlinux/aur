# Maintainer: Eve Kolb <evekolb2204@gmail.com>
pkgname=grizzly-bin
pkgver=0.4.8
pkgrel=1
pkgdesc="A utility for managing Jsonnet dashboards against the Grafana API"
arch=('x86_64')
url="https://github.com/grafana/grizzly"
license=('Apache-2.0')
source=("https://github.com/grafana/grizzly/releases/download/v${pkgver}/grr-linux-amd64")
noextract=("grr-linux-amd64")
sha256sums=('c10835d84360e32c98de64b07009f2df192ab6b65add424b6c6c12d76ede2e3d')
package() {
	cd "${srcdir}"
	install -Dm755 "grr-linux-amd64" "$pkgdir/usr/bin/grr"
}

