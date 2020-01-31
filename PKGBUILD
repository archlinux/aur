# Maintainer: Michael Clayfield <me@michaelclayfield.com>
pkgname=alerta-webui
pkgver=7.4.2
pkgrel=1
pkgdesc="A web interface for Alerta"
arch=('any')
url="https://github.com/alerta/alerta-webui"
license=('APACHE')
source=("https://github.com/alerta/alerta-webui/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha256sums=('d24c657c87180827538de6af7f01c52d5a67d7d9230d8bc81e1be430b37bf6ee')

package() {
	mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r dist/* "${pkgdir}/usr/share/webapps/${pkgname}"
}
