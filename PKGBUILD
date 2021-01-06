# Maintainer: Michael Clayfield <me@michaelclayfield.com>
pkgname=alerta-webui
pkgver=8.4.0
pkgrel=1
pkgdesc="A web interface for Alerta"
arch=('any')
url="https://github.com/alerta/alerta-webui"
license=('APACHE')
source=("https://github.com/alerta/alerta-webui/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha256sums=('9fb32c706332a97932e8c478da418dccb9ec6a29ebf6e91565e27e4fe5445b5d')

package() {
	mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r dist/* "${pkgdir}/usr/share/webapps/${pkgname}"
}
