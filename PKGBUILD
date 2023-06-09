# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=malias
pkgver=1.2.3
pkgrel=1
pkgdesc="An alias manager that allows you to easily add, delete or list your bash aliases"
arch=('any')
url="https://github.com/Antiz96/malias"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c0d31f26bc29524f2052ff84a7c51a799d5db1e53c585a4e3252936c9360c3fd')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
