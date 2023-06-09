# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=malias
pkgver=1.2.4
pkgrel=1
pkgdesc="An alias manager that allows you to easily add, delete or list your bash aliases"
arch=('any')
url="https://github.com/Antiz96/malias"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8d4dfa0e7981356b4a92488c32337e6e60fcddfb904c6db72ef108eefd8fb23d')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
