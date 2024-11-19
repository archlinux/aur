# Maintainer: Eve Kolb <evekolb2204@gmail.com>
pkgname=grizzly-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A utility for managing Jsonnet dashboards against the Grafana API"
arch=('x86_64')
url="https://github.com/grafana/grizzly"
license=('Apache-2.0')
source=("https://github.com/grafana/grizzly/releases/download/v${pkgver}/grr-linux-amd64")
noextract=("grr-linux-amd64")
sha256sums=('55ffef45fcdf67786c9bd96a5f09df3d9ad7d8b63c29207a449d0914c8534244')
conflicts=("grizzly")
package() {
	cd "${srcdir}"
	install -Dm755 "grr-linux-amd64" "$pkgdir/usr/bin/grr"
}

