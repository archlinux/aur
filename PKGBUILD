# Maintainer: Michael Clayfield <me@michaelclayfield.com>
pkgname=alerta-webui
pkgver=8.3.2
pkgrel=1
pkgdesc="A web interface for Alerta"
arch=('any')
url="https://github.com/alerta/alerta-webui"
license=('APACHE')
source=("https://github.com/alerta/alerta-webui/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha256sums=('179a2182c79c8b54c3ac9fa1b0e73e91bbc9b882585d3178cddbade5c1f1a134')

package() {
	mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r dist/* "${pkgdir}/usr/share/webapps/${pkgname}"
}
