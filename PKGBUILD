# Maintainer: nullgemm <nullgemm@mailbox.org>
pkgname=microstorm
pkgver=0.2.0
pkgrel=1
pkgdesc="minimal cursor theme without shadows"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/nullgemm/cursoryx"
license=('custom:WTFPL')
makedepends=('unzip')
source=("https://github.com/nullgemm/cursoryx/releases/download/v${pkgver}/${pkgname}_linux.zip")
sha256sums=('SKIP')

package() {
	install -d "${pkgdir}/usr/share/icons/${pkgname}"
	cp -rf "${srcdir}/${pkgname}/index.theme" "${pkgdir}/usr/share/icons/${pkgname}/"
	cp -rf "${srcdir}/${pkgname}/cursors" "${pkgdir}/usr/share/icons/${pkgname}/"
}
