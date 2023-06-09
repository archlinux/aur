# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=malias
pkgver=1.2.2
pkgrel=1
pkgdesc="An alias manager that allows you to easily add, delete or list your bash aliases"
arch=('any')
url="https://github.com/Antiz96/malias"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8b7a8e15dec1065af459de5b7f0a261e69b3caf1845b266a278442d00d3b77ac')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
