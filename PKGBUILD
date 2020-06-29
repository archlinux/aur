# Maintainer: Michael Clayfield <me@michaelclayfield.com>
pkgname=alerta-webui
pkgver=8.0.0
pkgrel=1
pkgdesc="A web interface for Alerta"
arch=('any')
url="https://github.com/alerta/alerta-webui"
license=('APACHE')
source=("https://github.com/alerta/alerta-webui/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha256sums=('e9bfa381f25bf282bbdce3f6a653c1b5908116ce220c99e7d241688f89a1f05a')

package() {
	mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r dist/* "${pkgdir}/usr/share/webapps/${pkgname}"
}
