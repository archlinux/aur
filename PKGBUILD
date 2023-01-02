# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=malias
pkgver=1.2.1
pkgrel=2
pkgdesc="An alias manager that allows you to easily add, delete or list your bash aliases"
arch=('any')
url="https://github.com/Antiz96/malias"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bac577ad3d15fc9edcbd8703879c67ed3f8f618c2bef8ddfc3faa579bfa8151d')

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
