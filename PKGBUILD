# Maintainer: Michael Clayfield <me@michaelclayfield.com>
pkgname=alerta-webui
pkgver=7.4.1
pkgrel=1
pkgdesc="A web interface for Alerta"
arch=('any')
url="https://github.com/alerta/alerta-webui"
license=('APACHE')
source=("https://github.com/alerta/alerta-webui/releases/download/v${pkgver}/${pkgname}.tar.gz")
sha256sums=('3010b0edd3f5975633cb3d7b40bf4279941728b8661e49973acda8bfa8914ba8')

package() {
	mkdir -p "${pkgdir}/usr/share/webapps/${pkgname}"
	cp -r dist/* "${pkgdir}/usr/share/webapps/${pkgname}"
}
